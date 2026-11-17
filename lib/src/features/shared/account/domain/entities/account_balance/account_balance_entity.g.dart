// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_balance_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountBalanceEntity _$AccountBalanceEntityFromJson(
  Map<String, dynamic> json,
) => _AccountBalanceEntity(
  inr: (json['INR'] as num?)?.toDouble() ?? 0,
  usd: (json['USD'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$AccountBalanceEntityToJson(
  _AccountBalanceEntity instance,
) => <String, dynamic>{'INR': instance.inr, 'USD': instance.usd};
