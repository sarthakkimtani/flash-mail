import "package:flutter/material.dart";

class ImageBanner extends StatelessWidget {
  final String imgSrc;
  final String text;

  const ImageBanner({
    Key? key,
    required this.imgSrc,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imgSrc, width: 250, height: 250),
          const SizedBox(height: 10),
          Text(text, style: Theme.of(context).textTheme.bodyLarge)
        ],
      ),
    );
  }
}
