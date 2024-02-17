import "package:auto_route/auto_route.dart";
import "package:flash_mail/data/providers/providers.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class AccountGuard extends AutoRouteGuard {
  final WidgetRef ref;

  AccountGuard(this.ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (!ref.read(accountProvider).isAuthenticated()) {
      router.replaceNamed("/");
    } else {
      resolver.next(true);
    }
  }
}
