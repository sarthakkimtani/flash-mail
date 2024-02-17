import "package:flutter/material.dart";

import "package:flash_mail/presentation/widgets/attachment/attachment_button.dart";

class AttachmentList extends StatelessWidget {
  final List<Map<String, dynamic>> attachments;

  const AttachmentList({super.key, required this.attachments});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: attachments.length,
      itemBuilder: (ctx, i) => AttachmentButton(file: attachments[i]),
    );
  }
}
