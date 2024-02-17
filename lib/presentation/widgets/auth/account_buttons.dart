import "package:auto_route/auto_route.dart";
import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:flash_mail/data/providers/providers.dart";
import "package:flash_mail/presentation/widgets/primary_button.dart";
import "package:flash_mail/presentation/widgets/secondary_button.dart";
import "package:flash_mail/presentation/widgets/small_loading_spinner.dart";

class AccountButtons extends StatelessWidget {
  const AccountButtons({super.key});

  void showErrorSnackBar(BuildContext ctx, String message) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _handleSubmit(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(accountProvider.notifier).createAccount();
      if (context.mounted) {
        AutoRouter.of(context).replaceNamed("/inbox");
      }
    } on DioError catch (err) {
      if (context.mounted) {
        showErrorSnackBar(context, err.message);
      }
    } catch (err) {
      if (context.mounted) {
        showErrorSnackBar(context, "Something went wrong!");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Your Inbox, Your Privacy, Zero Ads.",
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(height: 15),
        Consumer(
          builder: (context, ref, child) {
            return PrimaryButton(
              child: ref.watch(accountProvider).isLoading
                  ? const SmallLoadingSpinner()
                  : const Text("Create New Account"),
              onPressed: () => _handleSubmit(context, ref),
            );
          },
        ),
        const SizedBox(height: 5),
        SecondaryButton(
          text: "Use Existing",
          onPressed: () => AutoRouter.of(context).pushNamed("/login"),
        ),
      ],
    );
  }
}
