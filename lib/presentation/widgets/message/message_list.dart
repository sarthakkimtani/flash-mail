import "package:flutter/material.dart";

import "package:flash_mail/data/models/message/message.dart";
import "package:flash_mail/presentation/widgets/image_banner.dart";
import "package:flash_mail/presentation/widgets/message/message_tile.dart";

class MessageList extends StatelessWidget {
  final List<TMMessage> messages;
  final Future<void> Function() onRefresh;

  const MessageList({
    super.key,
    required this.messages,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: messages.isEmpty
          ? const ImageBanner(
              imgSrc: "assets/images/empty.png",
              text: "Your inbox is empty!",
            )
          : ListView.builder(
              itemBuilder: (ctx, i) => MessageTile(message: messages[i]),
              itemCount: messages.length,
            ),
    );
  }
}
