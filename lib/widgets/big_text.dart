// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../theme/dimensions.dart';


class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double relativeSize;
  TextOverflow overflow;
  double height;
  BigText({
    super.key,
    this.color = const Color(0xff332d2b),
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.relativeSize = 0,
    this.height = 1.2,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 1,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: relativeSize==0?Dimensions.font20:Dimensions.font20*relativeSize,
          fontWeight: FontWeight.w400,
          color: color,
          height: height),
    );
  }
}
