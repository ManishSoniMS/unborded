import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_constants.dart';
import '../../domain/dtos/place_order_dto.dart';
import '../../domain/entities/order_response/order_response_entity.dart';

abstract class OrderSource {
  Future<OrderResponseEntity> placeOrder(PlaceOrderDto dto);
}

@LazySingleton(as: OrderSource)
class OrderSourceImpl implements OrderSource {
  new(this._dio);

  final Dio _dio;

  @override
  Future<OrderResponseEntity> placeOrder(PlaceOrderDto dto) async {
    final result = await _dio.post(ApiConstants.placeOrder, data: dto.toMap());

    return OrderResponseEntity.fromJson(result.data as Map<String, dynamic>);
  }
}
