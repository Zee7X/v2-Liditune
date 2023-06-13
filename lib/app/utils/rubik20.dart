// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Rubik20 extends StatelessWidget {
  Color? color;
  final String text;
  final FontWeight? fontweight;
  final TextAlign? textalign;

  Rubik20({
    Key? key,
    this.color = const Color(
      0XFF000000,
    ),
    this.fontweight = FontWeight.w400,
    required this.text,
    this.textalign = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Rubik',
        color: color,
        fontSize: 20,
        fontWeight: fontweight,
      ),
      textAlign: textalign,
    );
  }
}
