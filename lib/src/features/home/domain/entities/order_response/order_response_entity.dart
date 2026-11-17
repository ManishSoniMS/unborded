import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/enums/enums.dart';

part 'order_response_entity.g.dart';
part 'order_response_entity.freezed.dart';

@freezed
abstract class OrderResponseEntity with _$OrderResponseEntity {
  const factory OrderResponseEntity({
    required String orderId,
    required String status,
    required String fundId,
    required Currency currency,
    required double amount,
    required DateTime placedAt,
  }) = _OrderResponseEntity;

  factory OrderResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseEntityFromJson(json);
}

