import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";

import "package:flash_mail/data/models/message/message.dart";
import "package:flash_mail/presentation/routes/app_router.gr.dart";
import "package:flash_mail/shared/utils/random_color.dart";

class MessageTile extends StatefulWidget {
  final TMMessage message;

  const MessageTile({super.key, required this.message});

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  late Color randomColor;

  @override
  void initState() {
    super.initState();
    randomColor = getRandomColor();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: const Color.fromRGBO(40, 70, 100, 1),
      focusColor: const Color.fromRGBO(22, 39, 56, 1),
      onTap: () => AutoRouter.of(context).push(
        MessageDetailRoute(
          id: widget.message.id,
          subject: widget.message.subject,
        ),
      ),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: randomColor,
        child: Text(
          widget.message.from["name"]!.toUpperCase()[0],
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
      title: Text(
        widget.message.from["name"] as String,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight:
                  widget.message.seen ? FontWeight.w500 : FontWeight.bold,
            ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.message.subject,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight:
                      widget.message.seen ? FontWeight.w300 : FontWeight.w500,
                ),
          ),
          Text(
            widget.message.intro ?? widget.message.subject,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: const Color.fromRGBO(193, 203, 213, 1),
                ),
          )
        ],
      ),
    );
  }
}
