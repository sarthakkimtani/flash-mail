import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:dio/dio.dart";

import "package:flash_mail/data/api/api_client.dart";
import "package:flash_mail/data/models/message/message.dart";
import "package:flash_mail/data/models/message_detail/message_detail.dart";
import "package:flash_mail/data/notifiers/account_notifier.dart";

final emailProvider = StateProvider<String?>((ref) => null);
final passwordProvider = StateProvider<String?>((ref) => null);

final dioProvider = Provider<Dio>(
  (ref) => Dio(
    BaseOptions(
      baseUrl: "https://api.mail.tm",
      connectTimeout: 2000,
    ),
  ),
);

final clientProvider = Provider<ApiClient>(
  (ref) => ApiClient(ref.read(dioProvider), ref),
);

final accountProvider = StateNotifierProvider<AccountNotifier, AccountState>(
  (ref) => AccountNotifier(ref),
);

final tokenProvider = StateProvider<String?>((ref) => null);

final messagesProvider = FutureProvider.autoDispose<List<TMMessage>>((ref) {
  final email = ref.read(emailProvider);
  final password = ref.read(passwordProvider);

  return ref.read(clientProvider).fetchMessages(email!, password!);
});

final messageDetailProvider = FutureProvider.family<TMMessageDetail, String>(
  (ref, id) => ref.read(clientProvider).fetchMessageDetail(id),
);
