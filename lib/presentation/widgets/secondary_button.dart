import "package:flutter/material.dart";

class SecondaryButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
