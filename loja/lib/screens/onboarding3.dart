import 'package:flutter/material.dart';
import 'package:loja/core/images.dart';


class BodyOnBoarding3 extends StatelessWidget {
  final String title;
  final String subtitle;

  const BodyOnBoarding3({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Column(
          children: [
            Container(
              height: 150,
              child: Image.asset(CustomImages.veterinario),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
