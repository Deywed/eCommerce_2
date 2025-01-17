import 'package:ecommerce_provider/components/shop.dart';
import 'package:ecommerce_provider/components/sneaker.dart';
import 'package:ecommerce_provider/provider/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SneakerTemplate extends StatelessWidget {
  SneakerTemplate({super.key, required this.s});

  Sneaker s;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Image.asset(s.image),
            Text(s.name),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$${s.price}"),
                  GestureDetector(
                    onTap: () {
                      if (context.read<UserProfile>().getMoney() < s.price) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Insufficient funds'),
                                content: Text(
                                    'You do not have enough money to buy this product'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('OK'),
                                  )
                                ],
                              );
                            });
                      } else {
                        context.read<Shop>().addToCart(s);
                        context.read<UserProfile>().setMoney(
                            context.read<UserProfile>().getMoney() - s.price);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Product added to cart'),
                                content: Text(
                                    'You have added ${s.name} to your cart'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('OK'),
                                  )
                                ],
                              );
                            });
                      }
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
