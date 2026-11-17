import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unbordered/src/core/utils/enums/enums.dart';
import 'package:unbordered/src/features/home/presentation/blocs/invest/investment/investment_cubit.dart';
import 'package:unbordered/src/features/home/presentation/widgets/invest_action_button.dart';
import 'package:unbordered/src/features/shared/account/presentation/blocs/account/account_cubit.dart';

class MockInvestmentCubit extends MockCubit<InvestmentState>
    implements InvestmentCubit {}

class MockAccountCubit extends MockCubit<AccountState>
    implements AccountCubit {}

void main() {
  late MockInvestmentCubit investment;
  late MockAccountCubit account;

  setUp(() {
    investment = MockInvestmentCubit();
    account = MockAccountCubit();
    when(() => account.state)
        .thenReturn(const AccountState(inr: 10000, usd: 50));
  });

  Widget wrap({VoidCallback? onSubmit}) => MaterialApp(
    home: Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<InvestmentCubit>.value(value: investment),
          BlocProvider<AccountCubit>.value(value: account),
        ],
        child: InvestActionButton(onSubmit: onSubmit ?? () {}),
      ),
    ),
  );

  ElevatedButton button(WidgetTester t) =>
      t.widget<ElevatedButton>(find.byType(ElevatedButton));

  testWidgets('enabled when amount within limits and balance', (tester) async {
    when(() => investment.state)
        .thenReturn(const InvestmentState(amount: 4000));

    await tester.pumpWidget(wrap());

    expect(button(tester).onPressed, isNotNull);
    expect(find.text('Available: ₹10,000'), findsOneWidget);
    expect(find.text('Remaining: ₹6,000'), findsOneWidget);
    expect(find.text('Insufficient funds'), findsNothing);
  });

  testWidgets('disabled + warning when amount exceeds balance', (tester) async {
    when(() => investment.state)
        .thenReturn(const InvestmentState(amount: 20000));

    await tester.pumpWidget(wrap());

    expect(button(tester).onPressed, isNull);
    expect(find.text('Insufficient funds'), findsOneWidget);
  });

  testWidgets('reacts to currency change from cubit stream', (tester) async {
    whenListen(
      investment,
      Stream.value(const InvestmentState(currency: Currency.USD, amount: 20)),
      initialState: const InvestmentState(amount: 2000),
    );

    await tester.pumpWidget(wrap());
    expect(find.text('Available: ₹10,000'), findsOneWidget);

    await tester.pump();
    expect(find.text(r'Available: $50'), findsOneWidget);
    expect(find.text(r'Remaining: $30'), findsOneWidget);
  });
}
