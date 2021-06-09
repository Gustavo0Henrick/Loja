import 'package:flutter/material.dart';
import 'package:loja/features/homepage/homepage.dart';
import 'package:loja/features/auth/loginpage.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loja Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/auth',
      routes: {
        '/auth': (_) => LoginPage(),
        '/home': (_) => HomePage(),
      },
      // home: LoginPage(),
    );
  }
}
