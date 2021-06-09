import 'package:flutter/material.dart';
import 'package:loja/src/core/colors.dart';
import 'package:loja/features/homepage/components/carousel.dart';
import 'package:loja/features/homepage/components/dots.dart';
import 'package:loja/features/homepage/drawer.dart';
import 'package:loja/features/homepage/row_buttons.dart';
import 'package:loja/src/core/routes.dart';
import 'package:loja/src/core/users.dart';

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
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: CustomColors.white,
          ),
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.65,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.search),
                Container(
                  width: 200,
                  child: Text(
                    "Buscar...",
                    style: TextStyle(color: CustomColors.grey),
                  ),
                ),
              ],
            ),
            enableFeedback: true,
            onTap: () {},
          ),
        ),
        backgroundColor: CustomColors.yellow,
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
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.1,
                0.7,
                0.7,
              ],
              colors: [
                CustomColors.yellow,
                CustomColors.orangeMain,
                CustomColors.white,
              ]),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                RowButtoms(),
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
                Container(
                  height: 430,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 20, left: 30, bottom: 10),
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
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                onTap: () {},
                                subtitle: Text("Test Test "),
                                title: Text("Teste"),
                                leading: Icon(Icons.phone_android_rounded),
                              );
                            },
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
