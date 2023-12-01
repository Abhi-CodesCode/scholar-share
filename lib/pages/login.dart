
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:scholar_shore/main.dart';
import 'package:scholar_shore/pages/signup.dart';
import 'package:scholar_shore/theme/dimensions.dart';
import 'package:scholar_shore/theme/theme_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:100.0),
              child: const Icon(Icons.book,size: 50,),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 22,left: 22,right: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Dimensions.height40,),
                  Center(child: Text("Welcome back!",style: TextStyle(fontSize: Dimensions.font24*1.2,fontWeight: FontWeight.w500),)),
                  SizedBox(height: Dimensions.height8*0.6,),
                  Center(child: Text("Please enter your details",style: TextStyle(fontSize: Dimensions.font14,fontWeight: FontWeight.w300),)),
                  SizedBox(height: Dimensions.height40*1.5,),
                  const TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      contentPadding: EdgeInsets.all(5),
                      labelText: "email",
                      labelStyle: TextStyle(color: Colors.black,fontSize:18),
                    ),
                  ),
                  SizedBox(height: Dimensions.height20,),
                  TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      contentPadding: EdgeInsets.all(5),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.black,fontSize:18),
                    ),
                  ),
                  Align(alignment: Alignment.bottomRight,child: TextButton(onPressed: () {}, child: Text("forgot password?",style: TextStyle(color: ThemeColors.fontColor2,fontWeight: FontWeight.w500),))),
                  SizedBox(height: Dimensions.height30*1.15,),
                  SizedBox(width: double.maxFinite,height:Dimensions.height40*1.2,child: ElevatedButton(onPressed: (){Get.offAllNamed('/home');}, child: Text("Log In",style: TextStyle(color: Colors.white,fontSize: 18.5),),style: ElevatedButton.styleFrom(backgroundColor: Colors.black87,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))),)),
                  SizedBox(height: Dimensions.height15,),
                  SizedBox(width: double.maxFinite,height:Dimensions.height40*1.2,child: SignInButton(Buttons.Google, onPressed: (){},shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),padding: EdgeInsets.only(left: Dimensions.width30),)),
                  SizedBox(
                    height: Dimensions.height40*4.3,
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: (){
                            Get.offAllNamed('/signup');
                          },
                            style: ButtonStyle(),
                            child: Row(
                            children: [Text("Don't have an Account? ",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w400),),
                              const Text("Sign Up",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black87),),
                            ],
                          ),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
