import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

import "package:flash_mail/shared/configs/flash_mail_icons.dart";

class UserQuota extends StatelessWidget {
  final String _url = "https://mail.tm/";

  final double value;

  const UserQuota({super.key, required this.value});

  Future<void> openUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 40, right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quota",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 15),
            LinearProgressIndicator(
              backgroundColor: const Color.fromRGBO(85, 97, 112, 1),
              color: Theme.of(context).primaryColor,
              value: value,
              minHeight: 10,
              borderRadius: BorderRadius.circular(5),
            ),
            const SizedBox(height: 25),
            InkWell(
              onTap: () => openUrl(Uri.parse(_url)),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Row(
                children: [
                  Text(
                    "Powered By Mail.tm",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    FlashMailIcons.redirect,
                    color: Theme.of(context).primaryColor,
                    size: 16,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
