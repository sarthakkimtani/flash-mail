import "package:flutter/material.dart";
import "package:auto_route/auto_route.dart";

import "package:flash_mail/presentation/widgets/auth/login_form.dart";

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Login",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 25),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
