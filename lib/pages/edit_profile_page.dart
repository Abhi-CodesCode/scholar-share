import 'package:flutter/material.dart';
import 'package:scholar_shore/functions/profile_page_functions/profile_page_functions.dart';
import 'package:scholar_shore/pages/working_on.dart';
import 'package:scholar_shore/theme/dimensions.dart';

class ButtonData{
  final IconData icon;
  final String text;
  final Widget page;
  ButtonData(this.icon,this.text,this.page);
}
class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ButtonData> buttonData=[
      ButtonData(Icons.edit, "Edit Profile",WorkingOnPage()),
      ButtonData(Icons.interests, "Edit Interests",WorkingOnPage()),
      ButtonData(Icons.bookmark, "Saved",WorkingOnPage()),
      ButtonData(Icons.report, "Report Content",WorkingOnPage()),
      ButtonData(Icons.bug_report, "Submit a bug",WorkingOnPage()),
      ButtonData(Icons.logout, "LogOut",WorkingOnPage()),
    ];


    // text editing controllers:

    TextEditingController email_controller= new TextEditingController();
    TextEditingController password_controller= new TextEditingController();
    TextEditingController full_name_controller= new TextEditingController();

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Material(
                elevation: 2,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                    color: Color(0xfeeeeeee),
                  ),
                  height: 260,
                  child:
                  Container(
                    width: double.maxFinite,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          //SizedBox(height: Dimensions.height30*2,),
                          SizedBox(height: Dimensions.height40*1.3,),
                          CircleAvatar(foregroundImage: AssetImage("assets/images/carousel/code_screen1.jpg",),radius: 50,
                          ),
                          SizedBox(height: Dimensions.height10,),
                         FutureBuilder(future: get_user_details(), builder: (BuildContext context, snapshot){
                           if(snapshot.connectionState==ConnectionState.waiting){
                             return Center(child: CircularProgressIndicator());
                           }
                           else if (snapshot.hasData){
                             var username= snapshot.data.toString();
                             return Column(children: [
                               Text("${username.substring(0,(username.length/2).toInt())}",style: TextStyle(fontSize: 30),),
                               Text("@$username",style: TextStyle(fontSize: 22),),
                             ]);
                           }
                           else {
                             return Text("Error");
                           }
                         })
                        ]),
                  ),

                ),
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Align(alignment: Alignment.topLeft,child: Padding(
                        padding: EdgeInsets.only(left: 8.0,bottom: Dimensions.height12),
                        child: Text("Edit your Profile",style: TextStyle(fontSize: Dimensions.font20,fontWeight: FontWeight.w600),),
                      )),
                      TextField(
                        controller: full_name_controller,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                          contentPadding: EdgeInsets.all(5),
                          labelText: "Update FullName",
                          labelStyle: TextStyle(color: Colors.black,fontSize:18),
                          hintText: "Your FullName",
                        ),
                      ),
                      SizedBox(height: Dimensions.height10,),
                      TextField(
                        controller: email_controller,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                          contentPadding: EdgeInsets.all(5),
                          labelText: "Update your email",
                          labelStyle: TextStyle(color: Colors.black,fontSize:18),
                          hintText: "yourEmail@mail.com",
                        ),
                      ),
                      SizedBox(height: Dimensions.height10,),
                      TextField(
                        controller: password_controller,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                          contentPadding: EdgeInsets.all(5),
                          labelText: "Update Password",
                          labelStyle: TextStyle(color: Colors.black,fontSize:18),
                          hintText: "********",
                        ),
                      ),
                      SizedBox(height: Dimensions.height40,),
                      SizedBox(width: double.maxFinite,height:Dimensions.height40*1.2,child: ElevatedButton(onPressed: () async{
                        update_profile(email: email_controller.text, password: password_controller.text, full_name: full_name_controller.text);

                      }, child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: 18.5),),style: ElevatedButton.styleFrom(backgroundColor: Colors.black87,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))),)),
                      SizedBox(height: Dimensions.height10*0.5,),
                      SizedBox(width: double.maxFinite,height:Dimensions.height40*1.2,child: ElevatedButton(onPressed: () {Navigator.pop(context);}, child: Text("Cancel",style: TextStyle(color: Colors.black87,fontSize: 18.5,fontWeight: FontWeight.w500),),style: ElevatedButton.styleFrom(backgroundColor: Colors.white60,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))),)),

                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
