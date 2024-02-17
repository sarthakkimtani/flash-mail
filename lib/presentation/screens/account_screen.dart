import "package:flutter/material.dart";
import "package:auto_route/auto_route.dart";

import "package:flash_mail/presentation/widgets/auth/account_buttons.dart";

@RoutePage()
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(
                image: AssetImage("assets/images/logo-small.png"),
              ),
              Text(
                "FlashMail",
                style: Theme.of(context).textTheme.titleLarge,
              )
            ],
          ),
          const AccountButtons()
        ],
      ),
    );
  }
}
