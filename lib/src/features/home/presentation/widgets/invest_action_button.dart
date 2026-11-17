import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums/enums.dart';
import '../../../../core/utils/extensions/extensions.dart';
import '../../../shared/account/presentation/blocs/account/account_cubit.dart';
import '../blocs/invest/investment/investment_cubit.dart';

class InvestActionButton extends StatelessWidget {
  const InvestActionButton({super.key, required this.onSubmit});

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final account = context.read<AccountCubit>().state;
    final usdBalance = account.usd;
    final inrBalance = account.inr;
    return BlocBuilder<InvestmentCubit, InvestmentState>(
      buildWhen: (previous, current) =>
          previous.currency != current.currency ||
          previous.amount != current.amount,
      builder: (context, state) {
        final currency = state.currency;
        final amount = state.amount;

        String? errorMessage;
        final available = currency == Currency.INR ? inrBalance : usdBalance;
        final remaining = available - amount;

        bool enable = true;
        if (remaining < 0) enable = false;
        if (amount > currency.max || amount < currency.min) {
          enable = false;
        }
        Color? errorColor;
        if (remaining < 0) {
          errorMessage = "Insufficient funds";
          errorColor = Colors.red;
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (errorMessage != null)
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(6),
                color: Colors.red,
                child: Center(child: Text(errorMessage)),
              ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Available: ${currency.sign}${available.toAmount}"),
                Text(
                  "Remaining: ${currency.sign}${remaining.toAmount}",
                  style: TextStyle(color: errorColor),
                ),
              ],
            ),
            SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: enable ? onSubmit : null,
                child: Text("Place Order"),
              ),
            ),
          ],
        );
      },
    );
  }
}
