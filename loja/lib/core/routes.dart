import 'package:flutter/material.dart';
import 'package:loja/screens/editprofile.dart';
import 'package:loja/screens/homepage.dart';
import 'package:loja/screens/loginpage.dart';
import 'package:loja/screens/password.dart';
import 'package:loja/screens/registerpage.dart';
import 'package:loja/screens/shopping_cart.dart';

abstract class CustomRoutes {
  static Widget homepage = HomePage();
  static Widget registerpage = RegisterPage();
  static Widget loginpage = LoginPage();
  static Widget editprofile = EditProfile();
  static Widget password = Password();
  static Widget shoppingcart = ShoppingCart();
}
