import 'package:ecommerce_provider/provider/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController amountController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 100),
          Image.asset('lib/assets/images/logo.jpg'),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 80),
            child: TextField(
              autocorrect: false,
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'Enter username',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 80),
            child: TextField(
              autocorrect: false,
              controller: amountController,
              decoration: InputDecoration(
                hintText: 'Enter amount of money',
              ),
            ),
          ),
          SizedBox(height: 150),
          GestureDetector(
            onTap: () {
              final String readNumber = amountController.text;
              final int? number = int.tryParse(readNumber);
              context.read<UserProfile>().setMoney(number);
              context.read<UserProfile>().setName(usernameController.text);
              context.go('/shop');
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 130, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),

      //logo
      //enter username
      //enter amount of money
    );
  }
}
