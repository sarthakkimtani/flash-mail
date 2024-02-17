// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountAdapter extends TypeAdapter<_$TMAccountImpl> {
  @override
  final int typeId = 0;

  @override
  _$TMAccountImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$TMAccountImpl(
      id: fields[0] as String,
      email: fields[1] as String,
      password: fields[2] as String,
      quota: fields[3] as int,
      used: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$TMAccountImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.quota)
      ..writeByte(4)
      ..write(obj.used);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TMAccountImpl _$$TMAccountImplFromJson(Map<String, dynamic> json) =>
    _$TMAccountImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      quota: json['quota'] as int,
      used: json['used'] as int,
    );

Map<String, dynamic> _$$TMAccountImplToJson(_$TMAccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'quota': instance.quota,
      'used': instance.used,
    };
