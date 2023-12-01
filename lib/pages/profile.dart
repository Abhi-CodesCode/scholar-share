import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_shore/pages/about_us.dart';
import 'package:scholar_shore/pages/bug_report.dart';
import 'package:scholar_shore/pages/edit_profile_page.dart';
import 'package:scholar_shore/pages/logout_page.dart';
import 'package:scholar_shore/pages/preferences.dart';
import 'package:scholar_shore/pages/working_on.dart';
import 'package:scholar_shore/theme/dimensions.dart';
import 'package:scholar_shore/theme/theme_colors.dart';

class ButtonData{
  final IconData icon;
  final String text;
  final Widget page;
  ButtonData(this.icon,this.text,this.page);
}
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    List<ButtonData> buttonData=[
      ButtonData(Icons.edit, "Edit Profile",const EditProfilePage()),
      ButtonData(Icons.interests, "Edit Interests", Preferences()),
      ButtonData(Icons.bookmark, "Saved",const WorkingOnPage()),
      ButtonData(Icons.bug_report, "Submit a bug",BugReportPage()),
      ButtonData(Icons.info, "About Us", AboutUsPage()),
      ButtonData(Icons.logout, "LogOut",LogOutPage()),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Material(
              elevation: 2,
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                  color: Color(0xfeeeeeee),
                ),
                height: 260,
                child:
                SizedBox(
                  width: double.maxFinite,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        //SizedBox(height: Dimensions.height30*2,),
                        SizedBox(height: Dimensions.height40*1.3,),
                        const CircleAvatar(foregroundImage: AssetImage("assets/images/carousel/code_screen1.jpg",),radius: 50,
                        ),
                        SizedBox(height: Dimensions.height10,),
                        const Text("User FullName",style: TextStyle(fontSize: 30),),
                        const Text("@Username",style: TextStyle(fontSize: 22),),
                      ]),
                ),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(14),
                physics:const NeverScrollableScrollPhysics(),
                itemCount: buttonData.length,
                itemBuilder:(BuildContext context , int index){
              return GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => buttonData[index].page));
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    title: Padding(
                      padding: const EdgeInsets.only(right: 8,top: 8,bottom: 8),
                      child: Row(
                        children: [
                          Icon(buttonData[index].icon),
                          const SizedBox(width: 10,),
                          Text(
                            buttonData[index].text,style: const TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            })
          ],
        ),
      )
    );
  }
}
