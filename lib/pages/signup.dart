
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scholar_shore/functions/auth/login_signup_function.dart';
import 'package:scholar_shore/main.dart';
import 'package:scholar_shore/pages/login_page.dart';
import 'package:scholar_shore/theme/dimensions.dart';
import 'package:scholar_shore/theme/theme_colors.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {

    var email_controller= new TextEditingController();
    var password_controller= new TextEditingController();
    var username_controller= new TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top:Dimensions.height40*2.5),
              child: Icon(Icons.book,size: Dimensions.iconSize30,),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Dimensions.height22,left: Dimensions.height22,right: Dimensions.height22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Dimensions.height40,),
                  Center(child: Text("Sign Up",style: TextStyle(fontSize: Dimensions.font24*1.2,fontWeight: FontWeight.w500),)),
                  SizedBox(height: Dimensions.height8*0.6,),
                  Center(child: Text("New Opportunities to come",style: TextStyle(fontSize: Dimensions.font14,fontWeight: FontWeight.w300),)),
                  SizedBox(height: Dimensions.height40*1,),
                  TextField(
                    //username text field
                    controller: username_controller,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      contentPadding: EdgeInsets.all(Dimensions.height6),
                      labelText: "Name",
                      labelStyle: TextStyle(color: Colors.black,fontSize:18),
                    ),
                  ),
                  SizedBox(height: Dimensions.height20,),
                  TextField(
                    //email text field
                    controller: email_controller,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      contentPadding: EdgeInsets.all(Dimensions.height6),
                      labelText: "your email",
                      labelStyle: TextStyle(color: Colors.black,fontSize:18),
                    ),
                  ),
                  SizedBox(height: Dimensions.height20,),
                  TextField(
                    //password controller
                    controller: password_controller,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      contentPadding: EdgeInsets.all(Dimensions.height6),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.black,fontSize:18),
                    ),
                  ),
                  SizedBox(height: Dimensions.height30*2,),
                  SizedBox(width: double.maxFinite,height:Dimensions.height40*1.2,child: ElevatedButton(onPressed: () async{

                    sign_up(email: email_controller.text, password: password_controller.text, username: username_controller.text);
                  }, child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 18.5),),style: ElevatedButton.styleFrom(backgroundColor: Colors.black87,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))),)),
                  SizedBox(height: Dimensions.height15,),
                  //SizedBox(width: double.maxFinite,height:Dimensions.height40*1.2,child: SignInButton(Buttons.Google, onPressed: (){},shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),padding: EdgeInsets.only(left: Dimensions.width30),)),
                  SizedBox(
                    height: Dimensions.height40*2.6,
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: (){
                            Get.offAllNamed('/login');
                          },child: Row(
                            children: [Text("Already have an Account? ",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w400),),
                              const Text("Log In",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black87),),
                            ],),)
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
