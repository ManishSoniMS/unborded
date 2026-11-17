import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_balance_entity.g.dart';
part 'account_balance_entity.freezed.dart';

@freezed
abstract class AccountBalanceEntity with _$AccountBalanceEntity {
  const factory AccountBalanceEntity({
    @JsonKey(name: 'INR') @Default(0) double inr,
    @JsonKey(name: 'USD') @Default(0) double usd,
  }) = _AccountBalanceEntity;

  factory AccountBalanceEntity.fromJson(Map<String, dynamic> json) =>
      _$AccountBalanceEntityFromJson(json);
}
