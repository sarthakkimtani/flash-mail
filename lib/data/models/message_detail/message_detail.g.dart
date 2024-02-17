// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TMMessageDetailImpl _$$TMMessageDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$TMMessageDetailImpl(
      id: json['id'] as String,
      from: Map<String, String>.from(json['from'] as Map),
      to: (json['to'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      cc: (json['cc'] as List<dynamic>).map((e) => e as String).toList(),
      bcc: (json['bcc'] as List<dynamic>).map((e) => e as String).toList(),
      subject: json['subject'] as String,
      text: json['text'] as String?,
      html: (json['html'] as List<dynamic>).map((e) => e as String).toList(),
      hasAttachments: json['hasAttachments'] as bool,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      downloadUrl: json['downloadUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TMMessageDetailImplToJson(
        _$TMMessageDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'to': instance.to,
      'cc': instance.cc,
      'bcc': instance.bcc,
      'subject': instance.subject,
      'text': instance.text,
      'html': instance.html,
      'hasAttachments': instance.hasAttachments,
      'attachments': instance.attachments,
      'downloadUrl': instance.downloadUrl,
      'createdAt': instance.createdAt.toIso8601String(),
    };
