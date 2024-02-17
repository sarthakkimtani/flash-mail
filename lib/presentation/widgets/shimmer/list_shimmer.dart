import "package:flutter/material.dart";

class ListShimmer extends StatelessWidget {
  const ListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromRGBO(160, 176, 186, 1),
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: const Color.fromRGBO(160, 176, 186, 1),
                width: MediaQuery.of(context).size.width * 0.65,
                height: 18,
              ),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: const Color.fromRGBO(160, 176, 186, 1),
                width: MediaQuery.of(context).size.width * 0.65,
                height: 18,
              ),
            ),
          ],
        )
      ],
    );
  }
}
