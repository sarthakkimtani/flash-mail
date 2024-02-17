// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TMMessageImpl _$$TMMessageImplFromJson(Map<String, dynamic> json) =>
    _$TMMessageImpl(
      id: json['id'] as String,
      from: Map<String, String>.from(json['from'] as Map),
      to: (json['to'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      intro: json['intro'] as String?,
      subject: json['subject'] as String,
      seen: json['seen'] as bool,
      isDeleted: json['isDeleted'] as bool,
      hasAttachments: json['hasAttachments'] as bool,
      downloadUrl: json['downloadUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TMMessageImplToJson(_$TMMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'to': instance.to,
      'intro': instance.intro,
      'subject': instance.subject,
      'seen': instance.seen,
      'isDeleted': instance.isDeleted,
      'hasAttachments': instance.hasAttachments,
      'downloadUrl': instance.downloadUrl,
      'createdAt': instance.createdAt.toIso8601String(),
    };
