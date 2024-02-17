import "package:flutter/material.dart";
import "package:flash/flash.dart";

class ToastMessage extends StatelessWidget {
  final FlashController controller;
  final IconData icon;
  final String text;

  const ToastMessage({
    super.key,
    required this.controller,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Flash(
      position: FlashPosition.bottom,
      controller: controller,
      child: AlertDialog(
        alignment: Alignment.bottomCenter,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
        content: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            const SizedBox(width: 20),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
