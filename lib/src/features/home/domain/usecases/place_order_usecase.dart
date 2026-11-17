import 'package:injectable/injectable.dart';

import '../../../../core/base/type_defs.dart';
import '../../../../core/base/usecase.dart';
import '../dtos/place_order_dto.dart';
import '../entities/order_response/order_response_entity.dart';
import '../repositories/order_repository.dart';

@lazySingleton
class PlaceOrderUsecase
    implements IUseCase<OrderResponseEntity, PlaceOrderDto> {
  new(this._repository);

  final OrderRepository _repository;

  @override
  FailureOr<OrderResponseEntity> call(PlaceOrderDto param) async {
    return await _repository.placeOrder(param);
  }
}
