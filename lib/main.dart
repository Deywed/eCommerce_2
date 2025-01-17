import 'package:ecommerce_provider/components/shop.dart';
import 'package:ecommerce_provider/components/sneaker_template.dart';
import 'package:ecommerce_provider/pages/cart_page.dart';
import 'package:ecommerce_provider/pages/intro_page.dart';
import 'package:ecommerce_provider/pages/login_page.dart';
import 'package:ecommerce_provider/pages/profile_page.dart';
import 'package:ecommerce_provider/pages/shop_page.dart';
import 'package:ecommerce_provider/provider/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final router = GoRouter(initialLocation: '/intro', routes: [
    GoRoute(path: '/intro', builder: (context, state) => IntroPage()),
    GoRoute(path: '/cart', builder: (context, state) => CartPage()),
    GoRoute(path: '/login', builder: (context, state) => LoginPage()),
    GoRoute(path: '/profile', builder: (context, state) => ProfilePage()),
    GoRoute(path: '/shop', builder: (context, state) => ShopPage()),
  ]);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserProfile()),
          ChangeNotifierProvider(create: (context) => Shop()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ));
  }
}
