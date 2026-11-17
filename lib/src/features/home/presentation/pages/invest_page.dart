import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injection/injection.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../../../core/utils/functions/debouncer.dart';
import '../../../../core/utils/validator/validator.dart';
import '../../../../core/widgets/loader.dart';
import '../../../shared/account/presentation/blocs/account/account_cubit.dart';
import '../blocs/invest/investment/investment_cubit.dart';
import '../widgets/invest_action_button.dart';
import '../widgets/success_pupup.dart';
import 'home_page.dart';

class InvestPage extends StatelessWidget {
  const InvestPage({super.key, required this.fundId});
  final String fundId;

  @override
  Widget build(BuildContext context) {
    String title = stocks.firstWhere((s) => s.id == fundId).name;
    return BlocProvider<InvestmentCubit>(
      create: (context) => getIt<InvestmentCubit>()..start(fundId),
      child: _InvestPage(title: title),
    );
  }
}

class _InvestPage extends StatefulWidget {
  const _InvestPage({required this.title});

  final String title;

  @override
  State<_InvestPage> createState() => _InvestPageState();
}

class _InvestPageState extends State<_InvestPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _amountKey =
      GlobalKey<FormFieldState<String>>();
  final _debouncer = Debouncer();

  void submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<InvestmentCubit>().placeOrder();
    }
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: BlocConsumer<InvestmentCubit, InvestmentState>(
        listener: (context, state) {
          if (state.status == BlocStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.failure?.message ?? "Something went wrong!",
                ),
              ),
            );
          }
          if (state.status == BlocStatus.loaded &&
              state.orderResponse != null) {
            context.read<AccountCubit>().update(
              state.orderResponse!.currency,
              state.orderResponse!.amount,
            );
            showSuccessPopUp(context, state.orderResponse!);
          }
        },
        buildWhen: (previous, current) =>
            previous.status == BlocStatus.loading ||
            current.status == BlocStatus.loading,
        builder: (context, state) {
          return AppLoader(
            isLoading: state.status == BlocStatus.loading,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<InvestmentCubit, InvestmentState>(
                          buildWhen: (previous, current) =>
                              previous.currency != current.currency,
                          builder: (context, state) {
                            final currency = state.currency;
                            return Expanded(
                              flex: 4,
                              child: TextFormField(
                                key: _amountKey,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d*\.?\d{0,2}'),
                                  ),
                                ],
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                  prefixIconConstraints: BoxConstraints(
                                    maxHeight: 24,
                                    maxWidth: 24,
                                  ),
                                  prefixIcon: Text(currency.sign),
                                ),
                                validator: FormValidator([
                                  RequiredValidator(),
                                  MinOrderValueValidator(
                                    currency: currency,
                                    amount: currency.min,
                                  ),
                                  MaxOrderValueValidator(
                                    currency: currency,
                                    amount: currency.max,
                                  ),
                                ]).call,
                                onChanged: (value) {
                                  _debouncer.run(() {
                                    context.read<InvestmentCubit>().setAmount(
                                      value,
                                    );
                                  });
                                },
                                onTapOutside: (event) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                              ),
                            );
                          },
                        ),
                        Expanded(
                          child: DropdownButtonFormField<Currency>(
                            initialValue: Currency.INR,

                            onChanged: (value) {
                              if (value == null) return;
                              context.read<InvestmentCubit>().setCurrency(
                                value,
                              );
                              // Re-run validation with new currency limits
                              // once field rebuilt, only if user typed.
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                final field = _amountKey.currentState;
                                if (field != null &&
                                    (field.value?.isNotEmpty ?? false)) {
                                  field.validate();
                                }
                              });
                            },
                            items: Currency.values
                                .map(
                                  (currency) => DropdownMenuItem<Currency>(
                                    value: currency,
                                    child: Text(currency.name),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    InvestActionButton(onSubmit: submitForm),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
