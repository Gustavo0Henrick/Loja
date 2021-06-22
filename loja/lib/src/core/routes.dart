import 'package:flutter/material.dart';
import 'package:loja/src/pages/login/loginpage.dart';
import 'package:loja/src/pages/profile/editprofile.dart';
import 'package:loja/features/homepage/homepage.dart';
import 'package:loja/src/pages/profile/password.dart';
import 'package:loja/src/pages/register/registerpage.dart';
import 'package:loja/src/pages/shopping_cart.dart';

abstract class CustomRoutes {
  static Widget homepage = HomePage();
  static Widget registerpage = RegisterPage();
  static Widget loginpage = LoginPage();
  static Widget editprofile = EditProfile();
  static Widget password = Password();
  static Widget shoppingcart = ShoppingCart();
}

