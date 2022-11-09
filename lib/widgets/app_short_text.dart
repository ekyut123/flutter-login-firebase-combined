// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AppShortText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
    AppShortText({Key? key,
      this.size = 15,
      required this.text,
      required this.color}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}