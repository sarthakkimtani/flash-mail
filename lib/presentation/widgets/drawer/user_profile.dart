import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flash/flash.dart";

import "package:flash_mail/presentation/widgets/drawer/toast_message.dart";

class UserProfile extends StatelessWidget {
  final String email;
  final String password;

  const UserProfile({
    super.key,
    required this.email,
    required this.password,
  });

  Future<void> copyClipboard(BuildContext context, String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (context.mounted) {
      showFlash(
        context: context,
        duration: const Duration(seconds: 2),
        builder: (context, controller) => ToastMessage(
          controller: controller,
          icon: Icons.check,
          text: "Copied to Clipboard!",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          radius: 35,
          child: Text(
            email[0].toUpperCase(),
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 30),
          ),
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () => copyClipboard(context, email),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              email,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        InkWell(
          onTap: () => copyClipboard(context, password),
          child: Text(
            "password: $password",
            style: const TextStyle(
              color: Color.fromRGBO(127, 133, 141, 1),
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}
