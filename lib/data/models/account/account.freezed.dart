// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TMAccount _$TMAccountFromJson(Map<String, dynamic> json) {
  return _TMAccount.fromJson(json);
}

/// @nodoc
mixin _$TMAccount {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get email => throw _privateConstructorUsedError;
  @HiveField(2)
  String get password => throw _privateConstructorUsedError;
  @HiveField(3)
  int get quota => throw _privateConstructorUsedError;
  @HiveField(4)
  int get used => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TMAccountCopyWith<TMAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TMAccountCopyWith<$Res> {
  factory $TMAccountCopyWith(TMAccount value, $Res Function(TMAccount) then) =
      _$TMAccountCopyWithImpl<$Res, TMAccount>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String email,
      @HiveField(2) String password,
      @HiveField(3) int quota,
      @HiveField(4) int used});
}

/// @nodoc
class _$TMAccountCopyWithImpl<$Res, $Val extends TMAccount>
    implements $TMAccountCopyWith<$Res> {
  _$TMAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? password = null,
    Object? quota = null,
    Object? used = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      quota: null == quota
          ? _value.quota
          : quota // ignore: cast_nullable_to_non_nullable
              as int,
      used: null == used
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TMAccountImplCopyWith<$Res>
    implements $TMAccountCopyWith<$Res> {
  factory _$$TMAccountImplCopyWith(
          _$TMAccountImpl value, $Res Function(_$TMAccountImpl) then) =
      __$$TMAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String email,
      @HiveField(2) String password,
      @HiveField(3) int quota,
      @HiveField(4) int used});
}

/// @nodoc
class __$$TMAccountImplCopyWithImpl<$Res>
    extends _$TMAccountCopyWithImpl<$Res, _$TMAccountImpl>
    implements _$$TMAccountImplCopyWith<$Res> {
  __$$TMAccountImplCopyWithImpl(
      _$TMAccountImpl _value, $Res Function(_$TMAccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? password = null,
    Object? quota = null,
    Object? used = null,
  }) {
    return _then(_$TMAccountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      quota: null == quota
          ? _value.quota
          : quota // ignore: cast_nullable_to_non_nullable
              as int,
      used: null == used
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: "AccountAdapter")
class _$TMAccountImpl implements _TMAccount {
  _$TMAccountImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.email,
      @HiveField(2) required this.password,
      @HiveField(3) required this.quota,
      @HiveField(4) required this.used});

  factory _$TMAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$TMAccountImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String email;
  @override
  @HiveField(2)
  final String password;
  @override
  @HiveField(3)
  final int quota;
  @override
  @HiveField(4)
  final int used;

  @override
  String toString() {
    return 'TMAccount(id: $id, email: $email, password: $password, quota: $quota, used: $used)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TMAccountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.quota, quota) || other.quota == quota) &&
            (identical(other.used, used) || other.used == used));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, password, quota, used);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TMAccountImplCopyWith<_$TMAccountImpl> get copyWith =>
      __$$TMAccountImplCopyWithImpl<_$TMAccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TMAccountImplToJson(
      this,
    );
  }
}

abstract class _TMAccount implements TMAccount {
  factory _TMAccount(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String email,
      @HiveField(2) required final String password,
      @HiveField(3) required final int quota,
      @HiveField(4) required final int used}) = _$TMAccountImpl;

  factory _TMAccount.fromJson(Map<String, dynamic> json) =
      _$TMAccountImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get email;
  @override
  @HiveField(2)
  String get password;
  @override
  @HiveField(3)
  int get quota;
  @override
  @HiveField(4)
  int get used;
  @override
  @JsonKey(ignore: true)
  _$$TMAccountImplCopyWith<_$TMAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
