import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unbordered/src/core/utils/enums/enums.dart';
import 'package:unbordered/src/features/home/domain/dtos/place_order_dto.dart';
import 'package:unbordered/src/features/home/domain/usecases/place_order_usecase.dart';
import 'package:unbordered/src/features/home/presentation/blocs/invest/investment/investment_cubit.dart';

import '../../../../helpers/fixtures.dart';

class MockPlaceOrderUsecase extends Mock implements PlaceOrderUsecase {}

class FakePlaceOrderDto extends Fake implements PlaceOrderDto {}

void main() {
  late MockPlaceOrderUsecase placeOrder;

  setUpAll(() => registerFallbackValue(FakePlaceOrderDto()));
  setUp(() => placeOrder = MockPlaceOrderUsecase());

  const seeded = InvestmentState(fundId: 'global-index-fund', amount: 5000);

  blocTest<InvestmentCubit, InvestmentState>(
    'placeOrder success emits [loading, loaded] and sends correct DTO',
    setUp: () =>
        when(() => placeOrder.call(any()))
            .thenAnswer((_) async => right(orderResponse)),
    build: () => InvestmentCubit(placeOrder: placeOrder),
    seed: () => seeded,
    act: (c) => c.placeOrder(),
    expect: () => [
      seeded.copyWith(status: BlocStatus.loading),
      seeded.copyWith(status: BlocStatus.loaded, orderResponse: orderResponse),
    ],
    verify: (_) {
      final dto =
          verify(() => placeOrder.call(captureAny())).captured.single
              as PlaceOrderDto;
      expect(dto.toMap(), {
        'fundId': 'global-index-fund',
        'currency': 'INR',
        'amount': 5000.0,
      });
    },
  );

  blocTest<InvestmentCubit, InvestmentState>(
    'placeOrder failure emits [loading, failure] with the Failure',
    setUp: () =>
        when(() => placeOrder.call(any()))
            .thenAnswer((_) async => left(serverFailure)),
    build: () => InvestmentCubit(placeOrder: placeOrder),
    seed: () => seeded,
    act: (c) => c.placeOrder(),
    expect: () => [
      seeded.copyWith(status: BlocStatus.loading),
      seeded.copyWith(status: BlocStatus.failure, failure: serverFailure),
    ],
  );
}
