import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications"),),
      body: Center(child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(child: Column(
        children: [
          SizedBox(height: Get.height*0.15,),
          Lottie.asset('assets/images/lotties/nothing_found.json',repeat: false),
          Text("No new notifications to show. we'll notify you when we'll have job opportunities for you.",textAlign: TextAlign.center,),
        ],
      )),
    )),);
  }
}
