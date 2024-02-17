import "package:auto_route/auto_route.dart";
import "package:flash_mail/data/providers/providers.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class AuthGuard extends AutoRouteGuard {
  final WidgetRef ref;

  AuthGuard(this.ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (ref.read(accountProvider).isAuthenticated()) {
      router.replaceNamed("/inbox");
    } else {
      resolver.next(true);
    }
  }
}
