import 'package:flutter/material.dart';
import 'package:loja/src/core/colors.dart';
import 'package:loja/src/core/components/animated_list.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Finalizar Compra"),
        centerTitle: true,
        backgroundColor: CustomColors.yellow,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: CustomColors.black,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) =>
                                        AnimatedListWidget()));
                          },
                          enableFeedback: true,
                          child: Text("Teste"),
                        ),
                      ),
                      Container(
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Finalizar",
                            style: TextStyle(
                              color: CustomColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: CustomColors.yellow,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Cancelar",
                            style: TextStyle(
                              color: CustomColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: CustomColors.lightred,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
