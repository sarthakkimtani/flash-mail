import "dart:convert";

import "package:dio/dio.dart";
import "package:flash_mail/data/providers/providers.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:flash_mail/data/models/account/account.dart";
import "package:flash_mail/data/models/message/message.dart";
import "package:flash_mail/data/models/message_detail/message_detail.dart";
import "package:flash_mail/shared/utils/random_string.dart";

class ApiClient {
  final Dio dio;
  final Ref ref;

  ApiClient(this.dio, this.ref);

  Future<void> generateToken(String address, String password) async {
    final tokenResponse = await dio.post(
      "/token",
      data: jsonEncode({"address": address, "password": password}),
    );
    final Map<String, dynamic> tokenData =
        tokenResponse.data as Map<String, dynamic>;

    ref.read(tokenProvider.notifier).state = tokenData["token"];
  }

  Future<TMAccount> createAccount() async {
    final response = await dio.get("/domains");
    final Map<String, dynamic> data = response.data as Map<String, dynamic>;
    final List<Map<String, dynamic>> domains = List.from(data["hydra:member"]);

    final username = randomString(7);
    final domain = domains[0]["domain"];
    Map<String, String> payload = {
      "address": "$username@$domain",
      "password": randomString(10),
    };

    final userResponse = await dio.post(
      "/accounts",
      data: jsonEncode(payload),
    );
    final Map<String, dynamic> info = userResponse.data as Map<String, dynamic>;
    payload["address"] = info["address"];

    await generateToken(
      payload["address"] as String,
      payload["password"] as String,
    );

    return TMAccount(
      id: info["id"],
      email: info["address"],
      password: payload["password"]!,
      quota: info["quota"],
      used: info["used"],
    );
  }

  Future<TMAccount> login(String address, String password) async {
    final response = await dio.post(
      "/token",
      data: jsonEncode({"address": address, "password": password}),
    );
    final Map<String, dynamic> tokenData =
        response.data as Map<String, dynamic>;

    ref.read(tokenProvider.notifier).state = tokenData["token"];
    final userId = tokenData["id"];

    final options = Options(headers: {
      "Authorization": "Bearer ${tokenData["token"]}",
    });
    final userResponse = await dio.get("/accounts/$userId", options: options);
    final Map<String, dynamic> info = userResponse.data as Map<String, dynamic>;

    return TMAccount(
      id: info["id"],
      email: address,
      password: password,
      quota: info["quota"],
      used: info["used"],
    );
  }

  Future<List<TMMessage>> fetchMessages(String email, String password) async {
    if (ref.read(tokenProvider) == null) {
      await generateToken(email, password);
    }

    final token = ref.read(tokenProvider);
    final options = Options(headers: {"Authorization": "Bearer $token"});
    final response = await dio.get("/messages", options: options);

    Map<String, dynamic> messageData = response.data as Map<String, dynamic>;
    final messages =
        List<Map<String, dynamic>>.from(messageData["hydra:member"]);

    return messages.map((message) => TMMessage.fromJson(message)).toList();
  }

  Future<TMMessageDetail> fetchMessageDetail(String id) async {
    if (ref.read(tokenProvider) == null) throw Exception("Token not found");

    final token = ref.read(tokenProvider);
    final options = Options(headers: {"Authorization": "Bearer $token"});
    final response = await dio.get("/messages/$id", options: options);

    Map<String, dynamic> messageData = response.data as Map<String, dynamic>;

    return TMMessageDetail.fromJson(messageData);
  }

  Future<void> deleteMessage(String id) async {
    if (ref.read(tokenProvider) == null) throw Exception("Token not found");

    final token = ref.read(tokenProvider);
    final options = Options(headers: {"Authorization": "Bearer $token"});
    await dio.delete("/messages/$id", options: options);
  }
}
