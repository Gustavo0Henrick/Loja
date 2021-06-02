import 'package:flutter/material.dart';

class DotIndicator extends StatefulWidget {
  final int currentIndex;

  const DotIndicator({Key key, this.currentIndex}) : super(key: key);

  @override
  _DotIndicatorState createState() => _DotIndicatorState();
}

class _DotIndicatorState extends State<DotIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 150),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: widget.currentIndex == 0 ? Colors.white : Colors.white30,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 5),
        AnimatedContainer(
          duration: Duration(milliseconds: 150),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: widget.currentIndex == 1 ? Colors.white : Colors.white30,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 5),
        AnimatedContainer(
          duration: Duration(milliseconds: 150),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: widget.currentIndex == 2 ? Colors.white : Colors.white30,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
