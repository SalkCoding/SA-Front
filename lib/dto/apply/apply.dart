import 'package:freezed_annotation/freezed_annotation.dart';

part 'apply.freezed.dart';
part 'apply.g.dart';

@freezed
class Apply with _$Apply {

  factory Apply({required String name, required int stuNum, required String department, required String phone, required String email, required String team, required String motivation, required String portfolio}) = _Apply;

  factory Apply.fromJson(Map<String, dynamic> json) => _$ApplyFromJson(json);
}