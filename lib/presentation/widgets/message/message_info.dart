import "package:flutter/material.dart";
import "package:intl/intl.dart";

class MessageInfo extends StatelessWidget {
  final String senderAddress;
  final String receiverAddress;
  final DateTime date;

  const MessageInfo({
    super.key,
    required this.senderAddress,
    required this.receiverAddress,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(127, 133, 140, 1),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "From",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Text(
                  senderAddress,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              )
            ],
          ),
          Row(
            children: [
              Text(
                "To",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Text(
                  receiverAddress,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              )
            ],
          ),
          Row(
            children: [
              Text(
                "Date",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(width: 10),
              Text(
                DateFormat.yMMMMd().add_jm().format(date.toLocal()),
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ],
      ),
    );
  }
}
