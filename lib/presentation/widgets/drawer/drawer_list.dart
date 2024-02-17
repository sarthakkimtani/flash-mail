import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:auto_route/auto_route.dart";

import "package:flash_mail/data/providers/providers.dart";
import "package:flash_mail/shared/configs/flash_mail_icons.dart";
import "package:flash_mail/presentation/widgets/drawer/drawer_list_tile.dart";

class DrawerList extends ConsumerWidget {
  const DrawerList({super.key});

  Future<void> signOut(BuildContext context, WidgetRef ref) async {
    Navigator.of(context).pop();
    await ref.read(accountProvider.notifier).logout();
    if (context.mounted) {
      AutoRouter.of(context).replaceNamed("/");
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Column(
        children: <Widget>[
          DrawerListTile(
            color: Theme.of(context).primaryColor,
            icon: FlashMailIcons.inbox,
            title: "Inbox",
            onTap: () => Navigator.of(context).pop(),
          ),
          Consumer(
            builder: (context, ref, _) => DrawerListTile(
              color: Theme.of(context).colorScheme.error,
              icon: FlashMailIcons.sign_out,
              title: "Sign out",
              onTap: () => signOut(context, ref),
            ),
          ),
        ],
      ),
    );
  }
}
