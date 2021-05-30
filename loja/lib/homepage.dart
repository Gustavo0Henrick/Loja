import 'package:flutter/material.dart';
import 'package:loja/core/colors.dart';
import 'package:loja/core/components/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(
        name: "Teste",
        email: "teste@teste.com",
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_bag,
              color: CustomColors.white,
            ),
            onPressed: () {},
          )
        ],
        centerTitle: true,
        title: Text(
          'Home Page',
          style: TextStyle(
            color: CustomColors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                CustomColors.yellow,
                CustomColors.orangeMain,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
