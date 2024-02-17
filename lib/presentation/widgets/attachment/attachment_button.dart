import "package:external_path/external_path.dart";
import "package:flash/flash.dart";
import "package:flutter/material.dart";
import "package:flutter_downloader/flutter_downloader.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:flash_mail/data/providers/providers.dart";
import "package:flash_mail/presentation/widgets/drawer/toast_message.dart";

class AttachmentButton extends ConsumerWidget {
  final Map<String, dynamic> file;

  const AttachmentButton({super.key, required this.file});

  Future<void> downloadFile(BuildContext ctx, WidgetRef ref, String url) async {
    final token = ref.read(tokenProvider);
    showFlash(
      context: ctx,
      duration: const Duration(seconds: 2),
      builder: (context, controller) => ToastMessage(
        controller: controller,
        icon: Icons.arrow_downward,
        text: "Starting download!",
      ),
    );

    await FlutterDownloader.enqueue(
      headers: {"Authorization": "Bearer $token"},
      url: "https://api.mail.tm$url",
      savedDir: await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS,
      ),
      saveInPublicStorage: true,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(137, 147, 164, 1),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.file_open_rounded,
            color: Colors.red,
            size: 24,
          ),
          const SizedBox(width: 10),
          Text(
            file["filename"],
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                splashColor: const Color.fromRGBO(40, 70, 100, 1),
                onPressed: () =>
                    downloadFile(context, ref, file["downloadUrl"]),
                icon: const Icon(
                  Icons.arrow_downward,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
