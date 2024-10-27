import 'package:freezed_annotation/freezed_annotation.dart';

part 'ocr_image.freezed.dart';
part 'ocr_image.g.dart';

@freezed
class OCRImage with _$OCRImage {

  factory OCRImage({required String imageFormat, required String encodedImage}) = _OCRImage;

  factory OCRImage.fromJson(Map<String, dynamic> json) => _$OCRImageFromJson(json);
}