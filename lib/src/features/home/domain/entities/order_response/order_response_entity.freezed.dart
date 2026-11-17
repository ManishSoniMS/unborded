// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderResponseEntity {

 String get orderId; String get status; String get fundId; Currency get currency; double get amount; DateTime get placedAt;
/// Create a copy of OrderResponseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderResponseEntityCopyWith<OrderResponseEntity> get copyWith => _$OrderResponseEntityCopyWithImpl<OrderResponseEntity>(this as OrderResponseEntity, _$identity);

  /// Serializes this OrderResponseEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderResponseEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderResponseEntity&&(identical(other.orderId, _this.orderId) || other.orderId == _this.orderId)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.fundId, _this.fundId) || other.fundId == _this.fundId)&&(identical(other.currency, _this.currency) || other.currency == _this.currency)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.placedAt, _this.placedAt) || other.placedAt == _this.placedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderResponseEntity;
  return Object.hash(runtimeType,_this.orderId,_this.status,_this.fundId,_this.currency,_this.amount,_this.placedAt);
}

@override
String toString() {
  final _this = this as OrderResponseEntity;
  return 'OrderResponseEntity(orderId: ${_this.orderId}, status: ${_this.status}, fundId: ${_this.fundId}, currency: ${_this.currency}, amount: ${_this.amount}, placedAt: ${_this.placedAt})';
}


}

/// @nodoc
abstract mixin class $OrderResponseEntityCopyWith<$Res>  {
  factory $OrderResponseEntityCopyWith(OrderResponseEntity value, $Res Function(OrderResponseEntity) _then) = _$OrderResponseEntityCopyWithImpl;
@useResult
$Res call({
 String orderId, String status, String fundId, Currency currency, double amount, DateTime placedAt
});




}
/// @nodoc
class _$OrderResponseEntityCopyWithImpl<$Res>
    implements $OrderResponseEntityCopyWith<$Res> {
  _$OrderResponseEntityCopyWithImpl(this._self, this._then);

  final OrderResponseEntity _self;
  final $Res Function(OrderResponseEntity) _then;

/// Create a copy of OrderResponseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? status = null,Object? fundId = null,Object? currency = null,Object? amount = null,Object? placedAt = null,}) {
  return _then(OrderResponseEntity(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,fundId: null == fundId ? _self.fundId : fundId // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderResponseEntity].
extension OrderResponseEntityPatterns on OrderResponseEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderResponseEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderResponseEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderResponseEntity value)  $default,){
final _that = this;
switch (_that) {
case _OrderResponseEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderResponseEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OrderResponseEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderId,  String status,  String fundId,  Currency currency,  double amount,  DateTime placedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderResponseEntity() when $default != null:
return $default(_that.orderId,_that.status,_that.fundId,_that.currency,_that.amount,_that.placedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderId,  String status,  String fundId,  Currency currency,  double amount,  DateTime placedAt)  $default,) {final _that = this;
switch (_that) {
case _OrderResponseEntity():
return $default(_that.orderId,_that.status,_that.fundId,_that.currency,_that.amount,_that.placedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderId,  String status,  String fundId,  Currency currency,  double amount,  DateTime placedAt)?  $default,) {final _that = this;
switch (_that) {
case _OrderResponseEntity() when $default != null:
return $default(_that.orderId,_that.status,_that.fundId,_that.currency,_that.amount,_that.placedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderResponseEntity implements OrderResponseEntity {
  const _OrderResponseEntity({required this.orderId, required this.status, required this.fundId, required this.currency, required this.amount, required this.placedAt});
  factory _OrderResponseEntity.fromJson(Map<String, dynamic> json) => _$OrderResponseEntityFromJson(json);

@override final  String orderId;
@override final  String status;
@override final  String fundId;
@override final  Currency currency;
@override final  double amount;
@override final  DateTime placedAt;

/// Create a copy of OrderResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderResponseEntityCopyWith<_OrderResponseEntity> get copyWith => __$OrderResponseEntityCopyWithImpl<_OrderResponseEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderResponseEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderResponseEntity&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.status, status) || other.status == status)&&(identical(other.fundId, fundId) || other.fundId == fundId)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.placedAt, placedAt) || other.placedAt == placedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,orderId,status,fundId,currency,amount,placedAt);
}

@override
String toString() {
    return 'OrderResponseEntity(orderId: $orderId, status: $status, fundId: $fundId, currency: $currency, amount: $amount, placedAt: $placedAt)';
}


}

/// @nodoc
abstract mixin class _$OrderResponseEntityCopyWith<$Res> implements $OrderResponseEntityCopyWith<$Res> {
  factory _$OrderResponseEntityCopyWith(_OrderResponseEntity value, $Res Function(_OrderResponseEntity) _then) = __$OrderResponseEntityCopyWithImpl;
@override @useResult
$Res call({
 String orderId, String status, String fundId, Currency currency, double amount, DateTime placedAt
});




}
/// @nodoc
class __$OrderResponseEntityCopyWithImpl<$Res>
    implements _$OrderResponseEntityCopyWith<$Res> {
  __$OrderResponseEntityCopyWithImpl(this._self, this._then);

  final _OrderResponseEntity _self;
  final $Res Function(_OrderResponseEntity) _then;

/// Create a copy of OrderResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? status = null,Object? fundId = null,Object? currency = null,Object? amount = null,Object? placedAt = null,}) {
  return _then(_OrderResponseEntity(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,fundId: null == fundId ? _self.fundId : fundId // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
