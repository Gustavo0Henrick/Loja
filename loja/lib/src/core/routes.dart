import 'package:flutter/material.dart';
import 'package:loja/src/screens/editprofile.dart';
import 'package:loja/features/homepage/homepage.dart';
import 'package:loja/features/auth/loginpage.dart';
import 'package:loja/src/screens/password.dart';
import 'package:loja/features/auth/registerpage.dart';
import 'package:loja/src/screens/shopping_cart.dart';

abstract class CustomRoutes {
  static Widget homepage = HomePage();
  static Widget registerpage = RegisterPage();
  static Widget loginpage = LoginPage();
  static Widget editprofile = EditProfile();
  static Widget password = Password();
  static Widget shoppingcart = ShoppingCart();
}
