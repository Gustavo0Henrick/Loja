import 'package:flutter/material.dart';
import 'package:loja/core/colors.dart';
import 'package:loja/core/components/carousel.dart';
import 'package:loja/core/components/dots.dart';
import 'package:loja/core/components/drawer.dart';
import 'package:loja/core/components/row_buttons.dart';
import 'package:loja/core/routes.dart';
import 'package:loja/core/users.dart';

class HomePage extends StatefulWidget {
  final int id;

  const HomePage({Key key, @required this.id}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(
        id: widget.id,
        name: CustomUser.users[widget.id]["name"],
        email: CustomUser.users[widget.id]["email"],
      ),
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: CustomColors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (builder) => CustomRoutes.shoppingcart),
              );
            },
          )
        ],
        centerTitle: true,
        title: Text(
          'Home Page',
          style: TextStyle(
            color: CustomColors.black,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: CustomColors.yellow,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                CustomColors.yellow,
                CustomColors.orangeMain,
              ]),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Carousel(
                    onChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
                Container(
                  child: DotIndicator(
                    currentIndex: currentIndex,
                  ),
                  height: 20,
                  width: 60,
                ),
                RowButtoms(),
                Container(
                  height: 550,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 30),
                          child: Row(
                            children: [
                              Text(
                                "Destaques",
                                style: TextStyle(
                                  color: CustomColors.orangeMain,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
