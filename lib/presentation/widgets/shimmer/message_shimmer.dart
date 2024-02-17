import "package:flutter/material.dart";
import "package:shimmer/shimmer.dart";

import "package:flash_mail/presentation/widgets/shimmer/list_shimmer.dart";

class MessageShimmer extends StatelessWidget {
  const MessageShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[500]!,
        highlightColor: Colors.grey[300]!,
        child: ListView.builder(
          itemBuilder: (ctx, i) => const Column(
            children: [
              ListShimmer(),
              SizedBox(height: 20),
            ],
          ),
          itemCount: 8,
        ),
      ),
    );
  }
}
