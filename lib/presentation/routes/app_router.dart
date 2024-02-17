import "package:auto_route/auto_route.dart";
import "package:flash_mail/presentation/routes/account_guard.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:flash_mail/presentation/routes/auth_guard.dart";

import "app_router.gr.dart";

@AutoRouterConfig(replaceInRouteName: "Screen,Route")
class AppRouter extends $AppRouter {
  final WidgetRef ref;

  AppRouter(this.ref);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AccountRoute.page,
          path: "/",
          initial: true,
          guards: [AuthGuard(ref)],
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: "/login",
        ),
        AutoRoute(
          page: InboxRoute.page,
          path: "/inbox",
          guards: [AccountGuard(ref)],
        ),
        AutoRoute(
          page: MessageDetailRoute.page,
          path: "/message",
        )
      ];
}
