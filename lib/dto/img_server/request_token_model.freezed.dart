// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestTokenModel _$RequestTokenModelFromJson(Map<String, dynamic> json) {
  return _RequestTokenModel.fromJson(json);
}

/// @nodoc
mixin _$RequestTokenModel {
  String get issuer => throw _privateConstructorUsedError;
  String get permission => throw _privateConstructorUsedError;
  Map<String, dynamic> get payload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestTokenModelCopyWith<RequestTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestTokenModelCopyWith<$Res> {
  factory $RequestTokenModelCopyWith(
          RequestTokenModel value, $Res Function(RequestTokenModel) then) =
      _$RequestTokenModelCopyWithImpl<$Res, RequestTokenModel>;
  @useResult
  $Res call({String issuer, String permission, Map<String, dynamic> payload});
}

/// @nodoc
class _$RequestTokenModelCopyWithImpl<$Res, $Val extends RequestTokenModel>
    implements $RequestTokenModelCopyWith<$Res> {
  _$RequestTokenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? issuer = null,
    Object? permission = null,
    Object? payload = null,
  }) {
    return _then(_value.copyWith(
      issuer: null == issuer
          ? _value.issuer
          : issuer // ignore: cast_nullable_to_non_nullable
              as String,
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestTokenModelImplCopyWith<$Res>
    implements $RequestTokenModelCopyWith<$Res> {
  factory _$$RequestTokenModelImplCopyWith(_$RequestTokenModelImpl value,
          $Res Function(_$RequestTokenModelImpl) then) =
      __$$RequestTokenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String issuer, String permission, Map<String, dynamic> payload});
}

/// @nodoc
class __$$RequestTokenModelImplCopyWithImpl<$Res>
    extends _$RequestTokenModelCopyWithImpl<$Res, _$RequestTokenModelImpl>
    implements _$$RequestTokenModelImplCopyWith<$Res> {
  __$$RequestTokenModelImplCopyWithImpl(_$RequestTokenModelImpl _value,
      $Res Function(_$RequestTokenModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? issuer = null,
    Object? permission = null,
    Object? payload = null,
  }) {
    return _then(_$RequestTokenModelImpl(
      issuer: null == issuer
          ? _value.issuer
          : issuer // ignore: cast_nullable_to_non_nullable
              as String,
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestTokenModelImpl implements _RequestTokenModel {
  _$RequestTokenModelImpl(
      {this.issuer = 'AIIA_AIR',
      required this.permission,
      required final Map<String, dynamic> payload})
      : _payload = payload;

  factory _$RequestTokenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestTokenModelImplFromJson(json);

  @override
  @JsonKey()
  final String issuer;
  @override
  final String permission;
  final Map<String, dynamic> _payload;
  @override
  Map<String, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  @override
  String toString() {
    return 'RequestTokenModel(issuer: $issuer, permission: $permission, payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestTokenModelImpl &&
            (identical(other.issuer, issuer) || other.issuer == issuer) &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            const DeepCollectionEquality().equals(other._payload, _payload));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, issuer, permission,
      const DeepCollectionEquality().hash(_payload));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestTokenModelImplCopyWith<_$RequestTokenModelImpl> get copyWith =>
      __$$RequestTokenModelImplCopyWithImpl<_$RequestTokenModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestTokenModelImplToJson(
      this,
    );
  }
}

abstract class _RequestTokenModel implements RequestTokenModel {
  factory _RequestTokenModel(
      {final String issuer,
      required final String permission,
      required final Map<String, dynamic> payload}) = _$RequestTokenModelImpl;

  factory _RequestTokenModel.fromJson(Map<String, dynamic> json) =
      _$RequestTokenModelImpl.fromJson;

  @override
  String get issuer;
  @override
  String get permission;
  @override
  Map<String, dynamic> get payload;
  @override
  @JsonKey(ignore: true)
  _$$RequestTokenModelImplCopyWith<_$RequestTokenModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
