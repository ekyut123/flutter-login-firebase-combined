import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppLongText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
    AppLongText({Key? key,
      this.size = 15,
      required this.text,
      required this.color}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}