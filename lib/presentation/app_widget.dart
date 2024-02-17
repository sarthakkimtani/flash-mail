import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:flash_mail/presentation/theme/theme.dart";
import "package:flash_mail/presentation/routes/app_router.dart";

class AppWidget extends ConsumerWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: "FlashMail",
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter(ref).config(),
    );
  }
}
