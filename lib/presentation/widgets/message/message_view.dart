import "package:flutter/widgets.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:flash_mail/data/models/message_detail/message_detail.dart";
import "package:flash_mail/data/providers/providers.dart";
import "package:flash_mail/presentation/widgets/attachment/attachment_list.dart";
import "package:flash_mail/presentation/widgets/message/message_body.dart";
import "package:flash_mail/presentation/widgets/message/message_sender.dart";

class MessageView extends StatelessWidget {
  final TMMessageDetail message;

  const MessageView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(
          builder: (context, ref, child) => MessageSender(
            senderName: message.from["name"] as String,
            senderAddress: message.from["address"] as String,
            receiverAddress: ref.read(emailProvider) as String,
            date: message.createdAt,
          ),
        ),
        const SizedBox(height: 25),
        MessageBody(
          html: message.html[0],
        ),
        message.hasAttachments
            ? AttachmentList(
                attachments: message.attachments!,
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
