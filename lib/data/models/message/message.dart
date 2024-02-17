import "package:freezed_annotation/freezed_annotation.dart";

part "message.freezed.dart";
part "message.g.dart";

@freezed
class TMMessage with _$TMMessage {
  factory TMMessage({
    required String id,
    required Map<String, String> from,
    required List<Map<String, String>> to,
    required String? intro,
    required String subject,
    required bool seen,
    required bool isDeleted,
    required bool hasAttachments,
    required String downloadUrl,
    required DateTime createdAt,
  }) = _TMMessage;

  factory TMMessage.fromJson(Map<String, dynamic> json) =>
      _$TMMessageFromJson(json);
}
