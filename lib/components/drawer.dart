import 'package:ecommerce_provider/components/drawer_button.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(children: [
        DrawerHeader(child: Image.asset("lib/assets/images/logo.jpg")),
        CustomDrawerButton(
            icon: Icon(Icons.home), name: "Shop", location: "shop"),
        CustomDrawerButton(
            icon: Icon(Icons.person), name: "Profile", location: "profile"),
        CustomDrawerButton(
            icon: Icon(Icons.shopping_cart), name: "Cart", location: "cart")
      ]),
    );
  }
}
