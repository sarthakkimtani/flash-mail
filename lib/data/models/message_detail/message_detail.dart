import "package:freezed_annotation/freezed_annotation.dart";

part "message_detail.freezed.dart";
part "message_detail.g.dart";

@freezed
class TMMessageDetail with _$TMMessageDetail {
  factory TMMessageDetail({
    required String id,
    required Map<String, String> from,
    required List<Map<String, String>> to,
    required List<String> cc,
    required List<String> bcc,
    required String subject,
    required String? text,
    required List<String> html,
    required bool hasAttachments,
    required List<Map<String, dynamic>>? attachments,
    required String downloadUrl,
    required DateTime createdAt,
  }) = _TMMessageDetail;

  factory TMMessageDetail.fromJson(Map<String, dynamic> json) =>
      _$TMMessageDetailFromJson(json);
}
