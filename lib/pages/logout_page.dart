import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_shore/pages/login.dart';
import 'package:scholar_shore/theme/dimensions.dart';

class LogOutPage extends StatelessWidget {
  const LogOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white10,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Are you sure",style: TextStyle(fontWeight: FontWeight.w500,fontSize: Dimensions.font20),),
              Text("you wanna logout?",style: TextStyle(fontWeight: FontWeight.w500,fontSize: Dimensions.font20),),
              SizedBox(height: Dimensions.height10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Cancel",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w700,fontSize: 18),),style: ElevatedButton.styleFrom(backgroundColor: Colors.white10),),
                SizedBox(width: Dimensions.width20,),
                TextButton(onPressed: (){Get.offAllNamed('/login');}, child: Text("Logout",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 18),),style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),),
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
