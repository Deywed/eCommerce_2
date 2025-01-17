import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawerButton extends StatelessWidget {
  const CustomDrawerButton(
      {super.key,
      required this.icon,
      required this.name,
      required this.location});

  final Icon icon;
  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: GestureDetector(
        onTap: () => context.go("/$location"),
        child: Row(
          children: [
            icon,
            Text(name),
          ],
        ),
      ),
    );
  }
}
