import 'package:ecommerce_provider/components/button.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomButton(icon: Icons.home, path: "home"),
          CustomButton(icon: Icons.person, path: "profile"),
          CustomButton(icon: Icons.shopping_cart, path: "cart"),
        ],
      ),
    );
  }
}
