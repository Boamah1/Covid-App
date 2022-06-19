import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Apptext extends StatelessWidget {
  double? size;
  final String text;
  final Color color;
  final FontWeight? fontWeight;

  Apptext({
    Key? key,
    this.color = Colors.black,
    this.size,
    required this.text,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
