import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
        centerTitle: true,
        title: Text(
          'Home Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.yellow,
                Colors.orange,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
