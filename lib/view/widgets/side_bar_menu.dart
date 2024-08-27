import 'package:flutter/material.dart';

Widget sideMenuBar() {
  return Column(
    children: [
      Expanded(
        child: ListView(
          children: [
            MenuIcons(
              icon: Icons.dashboard,
              color: Colors.indigo,
            ),
            MenuIcons(
              icon: Icons.shopping_cart,
            ),
            MenuIcons(
              icon: Icons.assessment,
            ),
            MenuIcons(
              icon: Icons.reorder,
            ),
            MenuIcons(
              icon: Icons.cancel,
            ),
            MenuIcons(
              icon: Icons.settings,
            )
          ],
        ),
      ),
    ],
  );
}

// ignore: must_be_immutable
class MenuIcons extends StatelessWidget {
  IconData? icon;
  Color? color;
  MenuIcons({super.key, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(icon, color: color ?? Colors.grey),
    );
  }
}
