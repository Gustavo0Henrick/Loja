import 'package:flutter/material.dart';
import 'package:loja/homepage.dart';
import 'package:loja/loginpage.dart';
import 'package:loja/registerpage.dart';

abstract class CustomRoutes {
  static Widget homepage = HomePage();
  static Widget registerpage = RegisterPage();
  static Widget loginpage = LoginPage();
}
