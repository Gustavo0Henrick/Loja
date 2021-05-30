import 'package:flutter/material.dart';
import 'package:loja/core/colors.dart';
import 'package:loja/core/components/drawer.dart';
import 'package:loja/core/users.dart';

class HomePage extends StatelessWidget {
  final int id;

  const HomePage({Key key, @required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(
        id: id,
        name: CustomUser.users[id]["name"],
        email: CustomUser.users[id]["email"],
      ),
      appBar: AppBar(
        elevation: 0,
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
