import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";

import "package:flash_mail/data/providers/providers.dart";
import "package:flash_mail/presentation/widgets/drawer/user_profile.dart";
import "package:flash_mail/presentation/widgets/drawer/drawer_list.dart";
import "package:flash_mail/presentation/widgets/drawer/user_quota.dart";

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.read(accountProvider);

    return Drawer(
      backgroundColor: const Color.fromRGBO(22, 39, 56, 1),
      child: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            UserProfile(
              email: account.user!.email,
              password: account.user!.password,
            ),
            const SizedBox(height: 50),
            const DrawerList(),
            UserQuota(
              value: account.user!.used / account.user!.quota,
            ),
          ],
        ),
      ),
    );
  }
}
