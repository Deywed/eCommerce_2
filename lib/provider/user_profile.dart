import 'package:flutter/material.dart';

class UserProfile extends ChangeNotifier {
  String? name;
  int? money;
  int numberOfOrders = 0;

  UserProfile({this.name = "", this.money = 0});

  void setMoney(int? newMoney) {
    money = newMoney;
    notifyListeners();
  }

  void setName(String newName) {
    name = newName;
    notifyListeners();
  }

  int getMoney() {
    return money!;
  }

  void incrementOrders() {
    numberOfOrders++;
    notifyListeners();
  }

  int get getOrders => numberOfOrders;
}
