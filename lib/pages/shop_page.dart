import 'package:ecommerce_provider/components/button.dart';
import 'package:ecommerce_provider/components/drawer.dart';
import 'package:ecommerce_provider/components/drawer_button.dart';
import 'package:ecommerce_provider/components/sneaker.dart';
import 'package:ecommerce_provider/components/sneaker_template.dart';
import 'package:ecommerce_provider/provider/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_provider/components/shop.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    final List<Sneaker> listOfProducts = context.watch<Shop>().getSneakers();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop"),
        backgroundColor: Colors.white,
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listOfProducts.length,
                  itemBuilder: (context, index) {
                    Sneaker s = listOfProducts[index];
                    return SneakerTemplate(s: s);
                  }),
            ),
            Text("\$${context.watch<UserProfile>().money.toString()}"),
            CustomButton(icon: Icons.shopping_bag, path: 'cart')
          ],
        ),
      ),
    );
  }
}
