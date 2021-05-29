import 'package:flutter/material.dart';

class CustomDots extends StatefulWidget {
  int page;

  CustomDots({Key key, this.page}) : super(key: key);

  @override
  _CustomDotsState createState() => _CustomDotsState();
}

class _CustomDotsState extends State<CustomDots> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 25,
          height: 8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.white)),
        ),
        Container(
          width: 25,
          height: 8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.white)),
        ),
        Container(
          width: 25,
          height: 8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.white)),
        ),
      ],
    );
  }
}
