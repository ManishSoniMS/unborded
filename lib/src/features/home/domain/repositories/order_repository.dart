import '../../../../core/base/type_defs.dart';
import '../dtos/place_order_dto.dart';
import '../entities/order_response/order_response_entity.dart';

abstract class OrderRepository {
  FailureOr<OrderResponseEntity> placeOrder(PlaceOrderDto dto);
}
