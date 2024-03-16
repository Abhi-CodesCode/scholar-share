import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_shore/pages/scheme_detail_page.dart';

class NavigatorObject extends StatelessWidget {
  final Widget child;
  final Map<String, dynamic> schemeData;

  const NavigatorObject({super.key, required this.child, required this.schemeData});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:() {
        Get.toNamed('/schemeDetailPage',arguments: schemeData);
      },
      child: child,
    );
  }
}
