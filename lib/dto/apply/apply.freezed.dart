// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apply.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Apply _$ApplyFromJson(Map<String, dynamic> json) {
  return _Apply.fromJson(json);
}

/// @nodoc
mixin _$Apply {
  String get name => throw _privateConstructorUsedError;
  int get stuNum => throw _privateConstructorUsedError;
  String get department => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get team => throw _privateConstructorUsedError;
  String get motivation => throw _privateConstructorUsedError;
  String get portfolio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplyCopyWith<Apply> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplyCopyWith<$Res> {
  factory $ApplyCopyWith(Apply value, $Res Function(Apply) then) =
      _$ApplyCopyWithImpl<$Res, Apply>;
  @useResult
  $Res call(
      {String name,
      int stuNum,
      String department,
      String phone,
      String email,
      String team,
      String motivation,
      String portfolio});
}

/// @nodoc
class _$ApplyCopyWithImpl<$Res, $Val extends Apply>
    implements $ApplyCopyWith<$Res> {
  _$ApplyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? stuNum = null,
    Object? department = null,
    Object? phone = null,
    Object? email = null,
    Object? team = null,
    Object? motivation = null,
    Object? portfolio = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      stuNum: null == stuNum
          ? _value.stuNum
          : stuNum // ignore: cast_nullable_to_non_nullable
              as int,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as String,
      motivation: null == motivation
          ? _value.motivation
          : motivation // ignore: cast_nullable_to_non_nullable
              as String,
      portfolio: null == portfolio
          ? _value.portfolio
          : portfolio // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplyImplCopyWith<$Res> implements $ApplyCopyWith<$Res> {
  factory _$$ApplyImplCopyWith(
          _$ApplyImpl value, $Res Function(_$ApplyImpl) then) =
      __$$ApplyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int stuNum,
      String department,
      String phone,
      String email,
      String team,
      String motivation,
      String portfolio});
}

/// @nodoc
class __$$ApplyImplCopyWithImpl<$Res>
    extends _$ApplyCopyWithImpl<$Res, _$ApplyImpl>
    implements _$$ApplyImplCopyWith<$Res> {
  __$$ApplyImplCopyWithImpl(
      _$ApplyImpl _value, $Res Function(_$ApplyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? stuNum = null,
    Object? department = null,
    Object? phone = null,
    Object? email = null,
    Object? team = null,
    Object? motivation = null,
    Object? portfolio = null,
  }) {
    return _then(_$ApplyImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      stuNum: null == stuNum
          ? _value.stuNum
          : stuNum // ignore: cast_nullable_to_non_nullable
              as int,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as String,
      motivation: null == motivation
          ? _value.motivation
          : motivation // ignore: cast_nullable_to_non_nullable
              as String,
      portfolio: null == portfolio
          ? _value.portfolio
          : portfolio // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplyImpl implements _Apply {
  _$ApplyImpl(
      {required this.name,
      required this.stuNum,
      required this.department,
      required this.phone,
      required this.email,
      required this.team,
      required this.motivation,
      required this.portfolio});

  factory _$ApplyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplyImplFromJson(json);

  @override
  final String name;
  @override
  final int stuNum;
  @override
  final String department;
  @override
  final String phone;
  @override
  final String email;
  @override
  final String team;
  @override
  final String motivation;
  @override
  final String portfolio;

  @override
  String toString() {
    return 'Apply(name: $name, stuNum: $stuNum, department: $department, phone: $phone, email: $email, team: $team, motivation: $motivation, portfolio: $portfolio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplyImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.stuNum, stuNum) || other.stuNum == stuNum) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.motivation, motivation) ||
                other.motivation == motivation) &&
            (identical(other.portfolio, portfolio) ||
                other.portfolio == portfolio));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, stuNum, department, phone,
      email, team, motivation, portfolio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplyImplCopyWith<_$ApplyImpl> get copyWith =>
      __$$ApplyImplCopyWithImpl<_$ApplyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplyImplToJson(
      this,
    );
  }
}

abstract class _Apply implements Apply {
  factory _Apply(
      {required final String name,
      required final int stuNum,
      required final String department,
      required final String phone,
      required final String email,
      required final String team,
      required final String motivation,
      required final String portfolio}) = _$ApplyImpl;

  factory _Apply.fromJson(Map<String, dynamic> json) = _$ApplyImpl.fromJson;

  @override
  String get name;
  @override
  int get stuNum;
  @override
  String get department;
  @override
  String get phone;
  @override
  String get email;
  @override
  String get team;
  @override
  String get motivation;
  @override
  String get portfolio;
  @override
  @JsonKey(ignore: true)
  _$$ApplyImplCopyWith<_$ApplyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
