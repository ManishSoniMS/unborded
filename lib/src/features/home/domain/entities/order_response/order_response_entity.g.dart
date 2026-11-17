// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderResponseEntity _$OrderResponseEntityFromJson(Map<String, dynamic> json) =>
    _OrderResponseEntity(
      orderId: json['orderId'] as String,
      status: json['status'] as String,
      fundId: json['fundId'] as String,
      currency: $enumDecode(_$CurrencyEnumMap, json['currency']),
      amount: (json['amount'] as num).toDouble(),
      placedAt: DateTime.parse(json['placedAt'] as String),
    );

Map<String, dynamic> _$OrderResponseEntityToJson(
  _OrderResponseEntity instance,
) => <String, dynamic>{
  'orderId': instance.orderId,
  'status': instance.status,
  'fundId': instance.fundId,
  'currency': _$CurrencyEnumMap[instance.currency]!,
  'amount': instance.amount,
  'placedAt': instance.placedAt.toIso8601String(),
};

const _$CurrencyEnumMap = {Currency.INR: 'INR', Currency.USD: 'USD'};
