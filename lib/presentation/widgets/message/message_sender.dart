import "package:flutter/material.dart";

import "package:flash_mail/presentation/widgets/message/message_info.dart";

class MessageSender extends StatefulWidget {
  final String senderName;
  final String senderAddress;
  final String receiverAddress;
  final DateTime date;

  const MessageSender({
    super.key,
    required this.senderName,
    required this.senderAddress,
    required this.receiverAddress,
    required this.date,
  });

  @override
  State<MessageSender> createState() => _MessageSenderState();
}

class _MessageSenderState extends State<MessageSender> {
  bool showInfo = false;

  void toggleInfo() {
    setState(() {
      showInfo = !showInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset("assets/images/avatar.png", width: 50, height: 50),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.senderName,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                GestureDetector(
                  onTap: () => toggleInfo(),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          widget.senderAddress,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                      Icon(
                        showInfo
                            ? Icons.keyboard_arrow_up_outlined
                            : Icons.keyboard_arrow_down_outlined,
                        color: const Color.fromRGBO(127, 133, 140, 1),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        showInfo
            ? MessageInfo(
                senderAddress: widget.senderAddress,
                receiverAddress: widget.receiverAddress,
                date: widget.date,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
