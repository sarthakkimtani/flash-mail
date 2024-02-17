import "package:flutter/material.dart";

class DrawerListTile extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final void Function() onTap;

  const DrawerListTile({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: const Color.fromRGBO(40, 70, 100, 1),
        highlightColor: const Color.fromRGBO(22, 39, 56, 1),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: color, size: 18),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: "Inter",
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
