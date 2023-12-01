// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:scholar_shore/theme/theme_colors.dart';

import '../theme/dimensions.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double relativeSize, height;
  TextOverflow overFlow;

  SmallText({
    super.key,
    this.color = Colors.black,
    required this.text,
    this.relativeSize = 0,
    this.height = 1.2,
    this.overFlow = TextOverflow.visible
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          overflow:overFlow,
          fontFamily: 'Roboto',
          fontSize: relativeSize==0?Dimensions.font12:Dimensions.font12*relativeSize,
          fontWeight: FontWeight.w400,
          height: height,
          color: color),
    );
  }
}
