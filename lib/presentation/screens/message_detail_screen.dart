import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:flash_mail/data/providers/providers.dart";
import "package:flash_mail/presentation/widgets/image_banner.dart";
import "package:flash_mail/presentation/widgets/message/message_view.dart";

@RoutePage()
class MessageDetailScreen extends ConsumerWidget {
  final String id;
  final String subject;

  const MessageDetailScreen({
    super.key,
    required this.id,
    required this.subject,
  });

  void deleteMessage(BuildContext context, WidgetRef ref) async {
    await ref.read(clientProvider).deleteMessage(id);
    ref.invalidate(messagesProvider);
    if (context.mounted) {
      AutoRouter.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(messageDetailProvider(id));

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => deleteMessage(context, ref),
            icon: const Icon(Icons.delete, color: Colors.white),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  subject,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 20),
                ),
              ),
              const SizedBox(height: 30),
              message.when(
                data: (data) => MessageView(message: data),
                error: (err, _) => const ImageBanner(
                  imgSrc: "assets/images/error.png",
                  text: "Something went wrong!",
                ),
                loading: () => const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
