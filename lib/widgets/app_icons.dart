import 'package:flutter/material.dart';
import 'package:scholar_shore/pages/working_on.dart';

const Color iconBackgroundColor=Color(0xffe0e0e0);
class AppIcons extends StatelessWidget {
  final Icon icon;
  double size;
  double iconSize;
  Color color;
  Widget page;
  AppIcons({required this.icon,this.size=44,this.iconSize=27,this.color=iconBackgroundColor,this.page=const WorkingOnPage(), super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: color),
      child: Icon(icon.icon,color: Colors.black,size: iconSize,),
    );
  }
}