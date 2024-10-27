// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ocr_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OCRImage _$OCRImageFromJson(Map<String, dynamic> json) {
  return _OCRImage.fromJson(json);
}

/// @nodoc
mixin _$OCRImage {
  String get imageFormat => throw _privateConstructorUsedError;
  String get encodedImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OCRImageCopyWith<OCRImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OCRImageCopyWith<$Res> {
  factory $OCRImageCopyWith(OCRImage value, $Res Function(OCRImage) then) =
      _$OCRImageCopyWithImpl<$Res, OCRImage>;
  @useResult
  $Res call({String imageFormat, String encodedImage});
}

/// @nodoc
class _$OCRImageCopyWithImpl<$Res, $Val extends OCRImage>
    implements $OCRImageCopyWith<$Res> {
  _$OCRImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageFormat = null,
    Object? encodedImage = null,
  }) {
    return _then(_value.copyWith(
      imageFormat: null == imageFormat
          ? _value.imageFormat
          : imageFormat // ignore: cast_nullable_to_non_nullable
              as String,
      encodedImage: null == encodedImage
          ? _value.encodedImage
          : encodedImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OCRImageImplCopyWith<$Res>
    implements $OCRImageCopyWith<$Res> {
  factory _$$OCRImageImplCopyWith(
          _$OCRImageImpl value, $Res Function(_$OCRImageImpl) then) =
      __$$OCRImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imageFormat, String encodedImage});
}

/// @nodoc
class __$$OCRImageImplCopyWithImpl<$Res>
    extends _$OCRImageCopyWithImpl<$Res, _$OCRImageImpl>
    implements _$$OCRImageImplCopyWith<$Res> {
  __$$OCRImageImplCopyWithImpl(
      _$OCRImageImpl _value, $Res Function(_$OCRImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageFormat = null,
    Object? encodedImage = null,
  }) {
    return _then(_$OCRImageImpl(
      imageFormat: null == imageFormat
          ? _value.imageFormat
          : imageFormat // ignore: cast_nullable_to_non_nullable
              as String,
      encodedImage: null == encodedImage
          ? _value.encodedImage
          : encodedImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OCRImageImpl implements _OCRImage {
  _$OCRImageImpl({required this.imageFormat, required this.encodedImage});

  factory _$OCRImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$OCRImageImplFromJson(json);

  @override
  final String imageFormat;
  @override
  final String encodedImage;

  @override
  String toString() {
    return 'OCRImage(imageFormat: $imageFormat, encodedImage: $encodedImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OCRImageImpl &&
            (identical(other.imageFormat, imageFormat) ||
                other.imageFormat == imageFormat) &&
            (identical(other.encodedImage, encodedImage) ||
                other.encodedImage == encodedImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, imageFormat, encodedImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OCRImageImplCopyWith<_$OCRImageImpl> get copyWith =>
      __$$OCRImageImplCopyWithImpl<_$OCRImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OCRImageImplToJson(
      this,
    );
  }
}

abstract class _OCRImage implements OCRImage {
  factory _OCRImage(
      {required final String imageFormat,
      required final String encodedImage}) = _$OCRImageImpl;

  factory _OCRImage.fromJson(Map<String, dynamic> json) =
      _$OCRImageImpl.fromJson;

  @override
  String get imageFormat;
  @override
  String get encodedImage;
  @override
  @JsonKey(ignore: true)
  _$$OCRImageImplCopyWith<_$OCRImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
