import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_downloader/flutter_downloader.dart";
import "package:hive_flutter/adapters.dart";

import "package:flash_mail/data/models/account/account.dart";
import "package:flash_mail/data/providers/providers.dart";
import "package:flash_mail/presentation/app_widget.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AccountAdapter());
  ProviderContainer container = ProviderContainer();
  await container.read(accountProvider.notifier).fetchAccount();
  await FlutterDownloader.initialize();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const AppWidget(),
    ),
  );
}
