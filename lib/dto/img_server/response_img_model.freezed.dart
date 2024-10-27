// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_img_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RespImageModel _$RespImageModelFromJson(Map<String, dynamic> json) {
  return _RespImageModel.fromJson(json);
}

/// @nodoc
mixin _$RespImageModel {
  String get message => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RespImageModelCopyWith<RespImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RespImageModelCopyWith<$Res> {
  factory $RespImageModelCopyWith(
          RespImageModel value, $Res Function(RespImageModel) then) =
      _$RespImageModelCopyWithImpl<$Res, RespImageModel>;
  @useResult
  $Res call({String message, String fileName, String date});
}

/// @nodoc
class _$RespImageModelCopyWithImpl<$Res, $Val extends RespImageModel>
    implements $RespImageModelCopyWith<$Res> {
  _$RespImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? fileName = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RespImageModelImplCopyWith<$Res>
    implements $RespImageModelCopyWith<$Res> {
  factory _$$RespImageModelImplCopyWith(_$RespImageModelImpl value,
          $Res Function(_$RespImageModelImpl) then) =
      __$$RespImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String fileName, String date});
}

/// @nodoc
class __$$RespImageModelImplCopyWithImpl<$Res>
    extends _$RespImageModelCopyWithImpl<$Res, _$RespImageModelImpl>
    implements _$$RespImageModelImplCopyWith<$Res> {
  __$$RespImageModelImplCopyWithImpl(
      _$RespImageModelImpl _value, $Res Function(_$RespImageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? fileName = null,
    Object? date = null,
  }) {
    return _then(_$RespImageModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RespImageModelImpl implements _RespImageModel {
  _$RespImageModelImpl(
      {required this.message, required this.fileName, required this.date});

  factory _$RespImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RespImageModelImplFromJson(json);

  @override
  final String message;
  @override
  final String fileName;
  @override
  final String date;

  @override
  String toString() {
    return 'RespImageModel(message: $message, fileName: $fileName, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RespImageModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, fileName, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RespImageModelImplCopyWith<_$RespImageModelImpl> get copyWith =>
      __$$RespImageModelImplCopyWithImpl<_$RespImageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RespImageModelImplToJson(
      this,
    );
  }
}

abstract class _RespImageModel implements RespImageModel {
  factory _RespImageModel(
      {required final String message,
      required final String fileName,
      required final String date}) = _$RespImageModelImpl;

  factory _RespImageModel.fromJson(Map<String, dynamic> json) =
      _$RespImageModelImpl.fromJson;

  @override
  String get message;
  @override
  String get fileName;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$RespImageModelImplCopyWith<_$RespImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
