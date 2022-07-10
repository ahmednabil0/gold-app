// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({
    this.fw,
    required this.color,
    required this.txt,
    required this.size,
    Key? key,
  }) : super(key: key);
  String txt;
  double size;
  Color color;
  FontWeight? fw;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(shadows: [
        BoxShadow(
            color: Colors.yellow[700]!,
            offset: const Offset(1.2, 1.2),
            blurRadius: 5)
      ], color: color, fontSize: size, fontWeight: fw),
    );
  }
}

class CustomText2 extends StatelessWidget {
  CustomText2({
    this.fw,
    required this.color,
    required this.txt,
    required this.size,
    Key? key,
  }) : super(key: key);
  String txt;
  double size;
  Color color;
  FontWeight? fw;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(shadows: const [
        BoxShadow(color: Colors.white, offset: Offset(1.2, 1.2), blurRadius: 5)
      ], color: color, fontSize: size, fontWeight: fw),
    );
  }
}
