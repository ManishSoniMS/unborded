import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unbordered/src/app/app.dart';
import 'package:unbordered/src/app/injection/injection.dart';
import 'package:unbordered/src/core/base/usecase.dart';
import 'package:unbordered/src/features/home/domain/dtos/place_order_dto.dart';
import 'package:unbordered/src/features/home/domain/usecases/place_order_usecase.dart';
import 'package:unbordered/src/features/home/presentation/blocs/invest/investment/investment_cubit.dart';
import 'package:unbordered/src/features/shared/account/domain/entities/account_balance/account_balance_entity.dart';
import 'package:unbordered/src/features/shared/account/domain/usecase/fetch_account_balance_usecase.dart';
import 'package:unbordered/src/features/shared/account/presentation/blocs/account/account_cubit.dart';
import 'package:unbordered/src/routes/route_manager.dart';

import '../test/helpers/fixtures.dart';

class MockPlaceOrder extends Mock implements PlaceOrderUsecase {}

class MockFetchBalance extends Mock implements FetchAccountBalanceUsecase {}

class FakeDto extends Fake implements PlaceOrderDto {}

class FakeNoParams extends Fake implements NoParams {}

/// App wraps everything in a GestureDetector(onDoubleTap), which delays
/// single taps until the double-tap window closes.
Future<void> _openFund(WidgetTester tester, String name) async {
  await tester.tap(find.text(name));
  await tester.pump(const Duration(milliseconds: 400));
  await tester.pumpAndSettle();
}

/// Full user journey with real UI, router, cubits and DI.
/// Only the network edge (use cases) is faked.
///
/// Run: `flutter test integration_test -d DEVICE_ID`
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MockPlaceOrder placeOrder;
  late MockFetchBalance fetchBalance;

  setUpAll(() {
    registerFallbackValue(FakeDto());
    registerFallbackValue(FakeNoParams());
  });

  setUp(() async {
    // RouteManager is a singleton: reset location between tests.
    RouteManager.instance.router.go('/home');
    await getIt.reset();
    placeOrder = MockPlaceOrder();
    fetchBalance = MockFetchBalance();

    when(() => fetchBalance.call(any())).thenAnswer(
      (_) async => right(const AccountBalanceEntity(inr: 10000, usd: 50)),
    );
    when(() => placeOrder.call(any()))
        .thenAnswer((_) async => right(orderResponse));

    getIt
      ..registerFactory<AccountCubit>(
        () => AccountCubit(fetchAccountBalance: fetchBalance),
      )
      ..registerFactory<InvestmentCubit>(
        () => InvestmentCubit(placeOrder: placeOrder),
      );
  });

  tearDown(getIt.reset);

  testWidgets('home -> invest -> place order -> success popup', (tester) async {
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();

    await _openFund(tester, 'Global Index Fund');

    await tester.enterText(find.byType(TextFormField), '5000');
    await tester.pump(const Duration(milliseconds: 600)); // debounce

    await tester.tap(find.text('Place Order'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Successful'), findsOneWidget);
    expect(find.text('ORD-10231'), findsOneWidget);
    verify(() => placeOrder.call(any())).called(1);
  });
}
