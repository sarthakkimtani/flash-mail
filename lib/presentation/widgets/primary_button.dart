import "package:flutter/material.dart";

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;

  const PrimaryButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
