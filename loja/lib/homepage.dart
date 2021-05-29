import 'package:flutter/material.dart';
import 'package:loja/core/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: CustomColors.white,
          onPressed: () {},
        ),
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
