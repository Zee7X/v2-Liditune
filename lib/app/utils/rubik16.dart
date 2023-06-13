import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Rubik16 extends StatelessWidget {
  Color? color;
  final String text;
  final FontWeight? fontweight;
  final TextAlign? textalign;
  final double? fontsize;
  final TextOverflow? texoverflow;
  final int? maxLines;

  Rubik16({
    Key? key,
    this.color = const Color(
      0XFF000000,
    ),
    this.fontweight = FontWeight.w300,
    required this.text,
    this.textalign,
    this.fontsize = 16,
    this.texoverflow,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Rubik',
        color: color,
        fontSize: fontsize,
        fontWeight: fontweight,
      ),
      textAlign: textalign,
    );
  }
}
