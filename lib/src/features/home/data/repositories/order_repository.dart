import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/type_defs.dart';
import '../../../../core/error/map_exception_to_failure.dart';
import '../../domain/dtos/place_order_dto.dart';
import '../../domain/entities/order_response/order_response_entity.dart';
import '../../domain/repositories/order_repository.dart';
import '../sources/order_source.dart';

@LazySingleton(as: OrderRepository)
class OrderRepositoryImpl implements OrderRepository {
  new(this._source);

  final OrderSource _source;
  
  @override
  FailureOr<OrderResponseEntity> placeOrder(PlaceOrderDto dto) async {
    try {
      final result = await _source.placeOrder(dto);
      return Right(result);
    } catch (e) {
      return Left(mapError(e));
    }
  }
}
