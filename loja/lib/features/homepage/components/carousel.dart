import 'package:flutter/material.dart';
import 'package:loja/src/core/colors.dart';

// ignore: must_be_immutable
class Carousel extends StatefulWidget {
  ValueChanged<int> onChanged;

  Carousel({Key key, this.onChanged}) : super(key: key);
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: widget.onChanged,
      physics: BouncingScrollPhysics(),
      children: [
        Card(
          elevation: 5,
          color: CustomColors.green,
        ),
        Card(
          elevation: 5,
          color: CustomColors.black,
        ),
        Card(
          elevation: 5,
          color: CustomColors.red,
        ),
      ],
    );
  }
}
