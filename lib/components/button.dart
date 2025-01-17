import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.icon, required this.path});

  final String path;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: () => context.go("/$path"),
        ),
      ],
    );
  }
}
