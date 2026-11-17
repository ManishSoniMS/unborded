// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_balance_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountBalanceEntity {

@JsonKey(name: 'INR') double get inr;@JsonKey(name: 'USD') double get usd;
/// Create a copy of AccountBalanceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountBalanceEntityCopyWith<AccountBalanceEntity> get copyWith => _$AccountBalanceEntityCopyWithImpl<AccountBalanceEntity>(this as AccountBalanceEntity, _$identity);

  /// Serializes this AccountBalanceEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AccountBalanceEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountBalanceEntity&&(identical(other.inr, _this.inr) || other.inr == _this.inr)&&(identical(other.usd, _this.usd) || other.usd == _this.usd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AccountBalanceEntity;
  return Object.hash(runtimeType,_this.inr,_this.usd);
}

@override
String toString() {
  final _this = this as AccountBalanceEntity;
  return 'AccountBalanceEntity(inr: ${_this.inr}, usd: ${_this.usd})';
}


}

/// @nodoc
abstract mixin class $AccountBalanceEntityCopyWith<$Res>  {
  factory $AccountBalanceEntityCopyWith(AccountBalanceEntity value, $Res Function(AccountBalanceEntity) _then) = _$AccountBalanceEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'INR') double inr,@JsonKey(name: 'USD') double usd
});




}
/// @nodoc
class _$AccountBalanceEntityCopyWithImpl<$Res>
    implements $AccountBalanceEntityCopyWith<$Res> {
  _$AccountBalanceEntityCopyWithImpl(this._self, this._then);

  final AccountBalanceEntity _self;
  final $Res Function(AccountBalanceEntity) _then;

/// Create a copy of AccountBalanceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inr = null,Object? usd = null,}) {
  return _then(AccountBalanceEntity(
inr: null == inr ? _self.inr : inr // ignore: cast_nullable_to_non_nullable
as double,usd: null == usd ? _self.usd : usd // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountBalanceEntity].
extension AccountBalanceEntityPatterns on AccountBalanceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountBalanceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountBalanceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountBalanceEntity value)  $default,){
final _that = this;
switch (_that) {
case _AccountBalanceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountBalanceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AccountBalanceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'INR')  double inr, @JsonKey(name: 'USD')  double usd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountBalanceEntity() when $default != null:
return $default(_that.inr,_that.usd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'INR')  double inr, @JsonKey(name: 'USD')  double usd)  $default,) {final _that = this;
switch (_that) {
case _AccountBalanceEntity():
return $default(_that.inr,_that.usd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'INR')  double inr, @JsonKey(name: 'USD')  double usd)?  $default,) {final _that = this;
switch (_that) {
case _AccountBalanceEntity() when $default != null:
return $default(_that.inr,_that.usd);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountBalanceEntity implements AccountBalanceEntity {
  const _AccountBalanceEntity({@JsonKey(name: 'INR') this.inr = 0, @JsonKey(name: 'USD') this.usd = 0});
  factory _AccountBalanceEntity.fromJson(Map<String, dynamic> json) => _$AccountBalanceEntityFromJson(json);

@override@JsonKey(name: 'INR') final  double inr;
@override@JsonKey(name: 'USD') final  double usd;

/// Create a copy of AccountBalanceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountBalanceEntityCopyWith<_AccountBalanceEntity> get copyWith => __$AccountBalanceEntityCopyWithImpl<_AccountBalanceEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountBalanceEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountBalanceEntity&&(identical(other.inr, inr) || other.inr == inr)&&(identical(other.usd, usd) || other.usd == usd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,inr,usd);
}

@override
String toString() {
    return 'AccountBalanceEntity(inr: $inr, usd: $usd)';
}


}

/// @nodoc
abstract mixin class _$AccountBalanceEntityCopyWith<$Res> implements $AccountBalanceEntityCopyWith<$Res> {
  factory _$AccountBalanceEntityCopyWith(_AccountBalanceEntity value, $Res Function(_AccountBalanceEntity) _then) = __$AccountBalanceEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'INR') double inr,@JsonKey(name: 'USD') double usd
});




}
/// @nodoc
class __$AccountBalanceEntityCopyWithImpl<$Res>
    implements _$AccountBalanceEntityCopyWith<$Res> {
  __$AccountBalanceEntityCopyWithImpl(this._self, this._then);

  final _AccountBalanceEntity _self;
  final $Res Function(_AccountBalanceEntity) _then;

/// Create a copy of AccountBalanceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inr = null,Object? usd = null,}) {
  return _then(_AccountBalanceEntity(
inr: null == inr ? _self.inr : inr // ignore: cast_nullable_to_non_nullable
as double,usd: null == usd ? _self.usd : usd // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
