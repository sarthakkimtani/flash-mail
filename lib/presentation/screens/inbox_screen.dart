import "dart:async";

import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:flash_mail/data/providers/providers.dart";
import "package:flash_mail/presentation/widgets/drawer/app_drawer.dart";
import "package:flash_mail/presentation/widgets/image_banner.dart";
import "package:flash_mail/presentation/widgets/message/message_list.dart";
import "package:flash_mail/presentation/widgets/shimmer/message_shimmer.dart";

@RoutePage()
class InboxScreen extends ConsumerStatefulWidget {
  const InboxScreen({super.key});

  @override
  ConsumerState<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends ConsumerState<InboxScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 30),
      (timer) => ref.refresh(messagesProvider),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(messagesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Inbox"),
      ),
      drawer: const AppDrawer(),
      body: messages.when(
        data: (data) => MessageList(
          messages: data,
          onRefresh: () => ref.refresh(messagesProvider.future),
        ),
        error: (err, _) => const ImageBanner(
          imgSrc: "assets/images/error.png",
          text: "Something went wrong!",
        ),
        loading: () => const MessageShimmer(),
        skipLoadingOnRefresh: true,
      ),
    );
  }
}
