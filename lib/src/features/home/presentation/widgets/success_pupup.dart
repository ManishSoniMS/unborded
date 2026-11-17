import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../../../core/utils/extensions/extensions.dart';
import '../../../../routes/app_routes.dart';
import '../../../shared/account/presentation/blocs/account/account_cubit.dart';
import '../../domain/entities/order_response/order_response_entity.dart';
import '../pages/home_page.dart';

void showSuccessPopUp(BuildContext context, OrderResponseEntity response) {
  String fundName = stocks.firstWhere((s) => s.id == response.fundId).name;
  final account = context.read<AccountCubit>().state;

  final balance = account.balance(response.currency);

  showDialog(
    context: context,
    barrierDismissible: false,
    routeSettings: RouteSettings(name: "show_success_pop_up"),
    builder: (context) {
      return SimpleDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
        children: [
          Lottie.asset(
            Assets.animations.success,
            height: 200,
            width: 200,
            repeat: false,
          ),
          SizedBox(height: 8),
          Center(
            child: Text(
              "Successful",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 12),
          _SuccessPopUpField(title: "Order ID", value: response.orderId),
          SizedBox(height: 8),
          _SuccessPopUpField(title: "Fund Name", value: fundName),
          SizedBox(height: 8),
          _SuccessPopUpField(
            title: "TXN Amount",
            value: response.amount.toAmount,
            currency: response.currency,
          ),
          SizedBox(height: 8),
          _SuccessPopUpField(
            title: "Balance",
            value: balance.toAmount,
            currency: response.currency,
          ),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => context.pushReplacement(AppRoutes.home),
            child: Text("Continue"),
          ),
        ],
      );
    },
  );
}

class _SuccessPopUpField extends StatelessWidget {
  const _SuccessPopUpField({
    required this.title,
    required this.value,
    this.currency,
  });

  final String title;
  final String value;
  final Currency? currency;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        Spacer(),
        if (currency != null) Text(currency!.sign),
        Text(value),
      ],
    );
  }
}
