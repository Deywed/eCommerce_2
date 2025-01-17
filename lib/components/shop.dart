import 'package:ecommerce_provider/components/sneaker.dart';
import 'package:ecommerce_provider/provider/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_provider/components/sneaker.dart';
import 'shop.dart';
import 'package:ecommerce_provider/provider/user_profile.dart';

class Shop extends ChangeNotifier {
  List<Sneaker> shop = [
    Sneaker(
        name: "Nike Jordan 4 Blue",
        price: 230,
        image: "lib/assets/images/plave.jpg"),
    Sneaker(
        name: "Nike Jordan 4 White",
        price: 250,
        image: "lib/assets/images/bele.jpg"),
  ];

  List<Sneaker> cart = [];

  List<Sneaker> getSneakers() {
    return shop;
  }

  List<Sneaker> getCart() {
    return cart;
  }

  void addToCart(Sneaker s) {
    cart.add(s);
  }

  void clearCart(BuildContext context) {
    context.read<UserProfile>().incrementOrders();
    cart.clear();
  }
}
