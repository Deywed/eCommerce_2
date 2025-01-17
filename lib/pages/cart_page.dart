import 'package:ecommerce_provider/components/drawer.dart';
import 'package:ecommerce_provider/components/shop.dart';
import 'package:ecommerce_provider/components/sneaker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Sneaker> CartItems = context.watch<Shop>().getCart();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Cart'),
          backgroundColor: Colors.white,
        ),
        drawer: CustomDrawer(),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: TextButton(
              onPressed: () {
                context.read<Shop>().clearCart(context);
                //context.go("cart");
              },
              child: Text("Order")),
        ),
        body: Center(
          child: Column(children: [
            Expanded(
              child: ListView.builder(
                  itemCount: CartItems.length,
                  itemBuilder: (context, index) {
                    Sneaker s = CartItems[index];
                    return ListTile(
                      title: Text(s.name),
                      leading: Image.asset(s.image),
                    );
                  }),
            ),
          ]),
        ));
  }
}
