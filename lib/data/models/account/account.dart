import "package:freezed_annotation/freezed_annotation.dart";
import "package:hive/hive.dart";

part "account.freezed.dart";
part "account.g.dart";

@freezed
class TMAccount with _$TMAccount {
  @HiveType(typeId: 0, adapterName: "AccountAdapter")
  factory TMAccount({
    @HiveField(0) required String id,
    @HiveField(1) required String email,
    @HiveField(2) required String password,
    @HiveField(3) required int quota,
    @HiveField(4) required int used,
  }) = _TMAccount;

  factory TMAccount.fromJson(Map<String, dynamic> json) =>
      _$TMAccountFromJson(json);
}
