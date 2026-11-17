import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../../../core/utils/enums/enums.dart';
import '../../../../domain/dtos/place_order_dto.dart';
import '../../../../domain/entities/order_response/order_response_entity.dart';
import '../../../../domain/usecases/place_order_usecase.dart';

part 'investment_state.dart';

@injectable
class InvestmentCubit extends Cubit<InvestmentState> {
  InvestmentCubit({required this._placeOrder}) : super(InvestmentState());

  final PlaceOrderUsecase _placeOrder;

  void start(String fundId) {
    emit(InvestmentState(fundId: fundId));
  }

  void setCurrency(Currency currency) {
    emit(state.copyWith(currency: currency));
  }

  void setAmount(String value) {
    emit(state.copyWith(amount: double.tryParse(value) ?? 0));
  }

  Future<void> placeOrder() async {
    emit(state.copyWith(status: BlocStatus.loading));
    final dto = PlaceOrderDto(
      amount: state.amount,
      fundId: state.fundId,
      currency: state.currency,
    );

    final result = await _placeOrder.call(dto);
    result.fold(
      (l) => emit(state.copyWith(status: BlocStatus.failure, failure: l)),
      (r) => emit(state.copyWith(status: BlocStatus.loaded, orderResponse: r)),
    );
  }
}
