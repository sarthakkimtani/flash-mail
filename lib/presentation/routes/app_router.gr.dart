// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flash_mail/presentation/screens/account_screen.dart' as _i1;
import 'package:flash_mail/presentation/screens/inbox_screen.dart' as _i2;
import 'package:flash_mail/presentation/screens/login_screen.dart' as _i3;
import 'package:flash_mail/presentation/screens/message_detail_screen.dart'
    as _i4;
import 'package:flutter/material.dart' as _i6;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountScreen(),
      );
    },
    InboxRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.InboxScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    MessageDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MessageDetailRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.MessageDetailScreen(
          key: args.key,
          id: args.id,
          subject: args.subject,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountScreen]
class AccountRoute extends _i5.PageRouteInfo<void> {
  const AccountRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.InboxScreen]
class InboxRoute extends _i5.PageRouteInfo<void> {
  const InboxRoute({List<_i5.PageRouteInfo>? children})
      : super(
          InboxRoute.name,
          initialChildren: children,
        );

  static const String name = 'InboxRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MessageDetailScreen]
class MessageDetailRoute extends _i5.PageRouteInfo<MessageDetailRouteArgs> {
  MessageDetailRoute({
    _i6.Key? key,
    required String id,
    required String subject,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          MessageDetailRoute.name,
          args: MessageDetailRouteArgs(
            key: key,
            id: id,
            subject: subject,
          ),
          initialChildren: children,
        );

  static const String name = 'MessageDetailRoute';

  static const _i5.PageInfo<MessageDetailRouteArgs> page =
      _i5.PageInfo<MessageDetailRouteArgs>(name);
}

class MessageDetailRouteArgs {
  const MessageDetailRouteArgs({
    this.key,
    required this.id,
    required this.subject,
  });

  final _i6.Key? key;

  final String id;

  final String subject;

  @override
  String toString() {
    return 'MessageDetailRouteArgs{key: $key, id: $id, subject: $subject}';
  }
}
