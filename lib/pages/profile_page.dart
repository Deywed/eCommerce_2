import 'package:ecommerce_provider/components/drawer.dart';
import 'package:ecommerce_provider/provider/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                child: Icon(
              Icons.person,
              size: 200,
            )),
            Text(
              context.watch<UserProfile>().name.toString(),
              style: TextStyle(fontSize: 20),
            ),
            Text(
              context.watch<UserProfile>().money.toString(),
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Number of orders ${context.watch<UserProfile>().getOrders}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
