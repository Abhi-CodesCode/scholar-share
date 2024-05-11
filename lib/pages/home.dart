import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_shore/constants/dbconstants.dart';
import 'package:scholar_shore/helper/navigator_object.dart';
import 'package:scholar_shore/lists.dart';
import 'package:scholar_shore/pages/about_us.dart';
import 'package:scholar_shore/pages/bug_report.dart';
import 'package:scholar_shore/pages/explore_page.dart';
import 'package:scholar_shore/pages/logout_page.dart';
import 'package:scholar_shore/pages/notification_page.dart';
import 'package:scholar_shore/pages/preferences.dart';
import 'package:scholar_shore/pages/profile.dart';
import 'package:scholar_shore/pages/search_page.dart';
import 'package:scholar_shore/theme/dimensions.dart';
import 'package:scholar_shore/theme/theme_colors.dart';
import 'package:scholar_shore/widgets/abhays_carousel.dart';
import 'package:scholar_shore/widgets/app_icons.dart';
import 'mod_page.dart';

import '../constants/explore_page_searchbar_constant.dart';
import '../functions/home_page_functions/get_user_interests.dart';
import '../widgets/app_buttons.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> schemeData1={'title': "hello world", 'description': "namasteIndia", 'image':'assets/images/carousel/code_screen1.jpg'};

    int currentIndex=0;
    CarouselController carouselController = CarouselController();
    CarouselController dotsController = CarouselController();

    final GlobalKey<ScaffoldState> scaffold_key = GlobalKey<ScaffoldState>();
    return  Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(child: ListView(children: [
        if(FirebaseAuth.instance.currentUser?.email=="mod@gmail.com")
          ListTile(title: Text("Mod Page",style: TextStyle(fontWeight: FontWeight.bold)),onTap:(){Get.to(ModPage(),transition: Transition.cupertino);} ,),
        ListTile(title: Text("About",style: TextStyle(fontWeight: FontWeight.bold),),onTap:(){Get.to(AboutUsPage(),transition: Transition.cupertino);} ,),
        ListTile(title: Text("Edit Interests",style: TextStyle(fontWeight: FontWeight.bold),),onTap:(){Get.to(Preferences(),transition: Transition.cupertino );} ,),
        ListTile(title: Text("Submit a bug",style: TextStyle(fontWeight: FontWeight.bold),),onTap:(){Get.to(BugReportPage(),transition: Transition.cupertino);} ,),
        ListTile(title: Text("Settings",style: TextStyle(fontWeight: FontWeight.bold),),onTap:(){Get.to(Profile(),transition: Transition.cupertino);} ,),
        ListTile(title: Text("LogOut",style: TextStyle(fontWeight: FontWeight.bold),),onTap:(){Get.to(LogOutPage(),transition: Transition.cupertino);} ,),


      ],),),
      appBar: AppBar(

          scrolledUnderElevation: 0,
          automaticallyImplyLeading:  false,// for hiding the inbuilt drawer
          toolbarHeight: Dimensions.appBarHeight,
          leading: null,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.all(Dimensions.height6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(builder: (context){
                  return GestureDetector(child: AppIcons(icon: Icon(Icons.menu)),onTap:(){Scaffold.of(context).openDrawer();},);}),
                Row(
                  children: [
                GestureDetector(
                child: AppButtons(icon: Icon(Icons.search)),
      onTap: () {
        Get.to(SearchPage());
      },
    ),

    SizedBox(width: Dimensions.width8,), GestureDetector(child: AppButtons(icon: Icon(Icons.notifications,)),onTap: (){Get.to(NotificationPage());}),
                  ],
                )
              ],
            ),
          )
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top:Dimensions.height15,left:Dimensions.height20,bottom: Dimensions.height12,right: Dimensions.height12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Trending Now",style: TextStyle(fontWeight: FontWeight.w600,fontSize: Dimensions.font24),
                      ),
                      CupertinoButton(onPressed: (){Get.to(SearchPage());}, child: Text("View All",style: TextStyle(color: ThemeColors.accentColor,fontWeight: FontWeight.w600,fontSize: Dimensions.font14),))
                    ],
                  ),
                ),
                // CarouselSlider(
                //   carouselController: carouselController,
                //   items: MyImages.imgList.map<Widget>((item) => NavigatorObject(
                //     schemeData: schemeData1,
                //     child: Container(
                //       margin: EdgeInsets.symmetric(horizontal: Dimensions.width8/2),
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(Dimensions.radius30),
                //           image: DecorationImage(image:AssetImage(item),fit: BoxFit.cover,)
                //       ),
                //     ),
                //   )).toList(), options: CarouselOptions(
                //     height: Dimensions.carouselHeight,
                //     viewportFraction: 0.87,
                //     enlargeCenterPage: true,
                //     enlargeFactor: 0.2,
                //     initialPage: 0,
                //     autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                //     onPageChanged: (index,reason){
                //       // This will update the dots indicator
                //     }
                // ),
                // ),
                AbhaysCarousel(),
                Padding(
                  padding: EdgeInsets.only(top:Dimensions.height15,left:Dimensions.height20,bottom: Dimensions.height12,right: Dimensions.height12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("For You",style: TextStyle(fontWeight: FontWeight.w600,fontSize: Dimensions.font24),
                      ),
                      CupertinoButton(onPressed: (){Get.to(SearchPage());}, child: Text("View All",style: TextStyle(color: ThemeColors.accentColor,fontWeight: FontWeight.w600,fontSize: Dimensions.font14),))
                    ],
                  ),
                ),

                FutureBuilder<List<String>>(
                  future: getUserInterests(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      final categories = snapshot.data;
                      if (categories != null && categories.isNotEmpty) {
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: categories.map((category) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 20,top: 8,bottom: 8,right: 8),
                                    child: Text(
                                      category,
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  FutureBuilder<List<Map<String, dynamic>>>(

                                    future: getTopPostsForCategory(category),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return Center(child: CircularProgressIndicator());
                                      } else if (snapshot.hasError) {
                                        return Center(child: Text('Error: ${snapshot.error}'));
                                      } else {
                                        final posts = snapshot.data;
                                        if (posts != null && posts.isNotEmpty) {

                                          return Column(
                                            children: posts.map((post) {
                                              return NavigatorObject(
                                                  schemeData: post,
                                                  child: Padding(
                                                      padding: EdgeInsets.only(top:Dimensions.height8,left: Dimensions.width15,
                                                          //previous right padding //right: Dimensions.width15,
                                                          right:0,
                                                          bottom: Dimensions.height6),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                        ),
                                                        //width: Get.width<500? double.maxFinite: Get.width*0.8,
                                                        child: Row(
                                                          children: [
                                                            Container(

                                                                width:Dimensions.listImageHeight,
                                                                height:Dimensions.listImageHeight,
                                                                decoration:BoxDecoration(borderRadius:BorderRadius.circular(Dimensions.radius20),image: DecorationImage(image: Image.network(post["post_image"]).image, fit: BoxFit.cover,))),
                                                            Padding(
                                                              padding: EdgeInsets.all(Dimensions.height8),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  SizedBox(
                                                                    width: Get.width*0.4,
                                                                    child: Text(" ${post['organization_name']}",overflow: TextOverflow.ellipsis,style: TextStyle(
                                                                        color: ThemeColors.fontColor2,fontWeight: FontWeight.w400,
                                                                    ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(height: Dimensions.height10,),
                                                                  SizedBox(
                                                                    width: Get.width*0.5,
                                                                    child: Text("${post['title']}",maxLines: 2,overflow: TextOverflow.ellipsis,
                                                                      style: TextStyle(
                                                                          fontSize: 18 ,
                                                                          fontWeight: FontWeight.w500
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(height: Dimensions.height8,),

                                                                  //this was row previously but i changed it to wrap cuz of overflow
                                                                  Wrap(
                                                                    children: [
                                                                      CircleAvatar(backgroundImage: Image.network(post["post_image"],).image,radius:Dimensions.radius12,),
                                                                      SizedBox(width: Dimensions.width6,),
                                                                      SizedBox(
                                                                        width: Dimensions.screenWidth*0.4,
                                                                        child: Text("${post["posted_by"]}",overflow: TextOverflow.ellipsis,style: TextStyle(
                                                                            color: ThemeColors.fontColor2,
                                                                            fontWeight: FontWeight.w500,
                                                                            fontSize: Dimensions.font12
                                                                        ),),
                                                                      ),

                                                                      // Text(" • ",style: TextStyle(
                                                                      // color: ThemeColors.fontColor2,
                                                                      // fontWeight: FontWeight.w800,
                                                                      // fontSize: Dimensions.font12,
                                                                      // ),),
                                                                    ],
                                                                  ),

                                                                  Padding(
                                                                    padding: const EdgeInsets.only(top:8.0),
                                                                    child: Text("Posted on: ${post["posted_on"].toDate().toIso8601String().split('T').first}",style: TextStyle(
                                                                        color: ThemeColors.fontColor2,
                                                                        fontWeight: FontWeight.w400,
                                                                        fontSize: Dimensions.font12
                                                                    ),),
                                                                  )
                                                                ],),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                  )
                                              );
                                            }).toList(),
                                          );
                                        } else {
                                          return Center(child: Text('No recent opportunities   '));
                                        }
                                      }
                                    },
                                  ),

                                ],
                              );
                            }).toList(),
                          ),
                        );
                      } else {
                        return Center(child: Text('No categories found.'));
                      }
                    }
                  },
                ),
                // old.
                // ListView.builder(
                //     shrinkWrap: true,
                //     itemCount:MyImages.imgList.length,
                //     physics: const NeverScrollableScrollPhysics(),
                //     itemBuilder:
                //         (BuildContext context, int index){
                //       return NavigatorObject(
                //         schemeData: schemeData1,
                //         child: Padding(
                //             padding: EdgeInsets.only(top:Dimensions.height8,left: Dimensions.width15,right: Dimensions.width15,bottom: Dimensions.height6),
                //             child: Container(
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(Dimensions.radius20),
                //               ),
                //               width: Dimensions.screenWidth*0.95,
                //               child: Row(
                //                 children: [
                //                     Container(
                //                         width:Dimensions.listImageHeight,
                //                         height:Dimensions.listImageHeight,
                //                         decoration:BoxDecoration(borderRadius:BorderRadius.circular(Dimensions.radius20),image: DecorationImage(image: Image.asset(MyImages.imgList[index], cacheHeight: 200,cacheWidth: 200,).image,fit: BoxFit.cover,))),
                //                   Padding(
                //                     padding: EdgeInsets.all(Dimensions.height8),
                //                     child: Column(
                //                       mainAxisAlignment: MainAxisAlignment.start,
                //                       crossAxisAlignment: CrossAxisAlignment.start,
                //                       children: [
                //                         Text("title comes here",style: TextStyle(
                //                             color: ThemeColors.fontColor2,fontWeight: FontWeight.w400
                //                         ),
                //                         ),
                //                         SizedBox(height: Dimensions.height10,),
                //                         SizedBox(
                //                           width: Dimensions.screenWidth*0.4,
                //                           child: const Text("Well who's the boss now bitch, description comes here",maxLines: 2,overflow: TextOverflow.ellipsis,
                //                             style: TextStyle(
                //                                 fontSize: 18 ,
                //                                 fontWeight: FontWeight.w500
                //                             ),
                //                           ),
                //                         ),
                //                         SizedBox(height: Dimensions.height8,),
                //
                //                         Row(
                //                           children: [
                //                             CircleAvatar(backgroundImage: AssetImage(MyImages.imgList[index]),radius:Dimensions.radius12,),
                //                             SizedBox(width: Dimensions.width6,),
                //                             Text("Posted by: UserName",style: TextStyle(
                //                                 color: ThemeColors.fontColor2,
                //                                 fontWeight: FontWeight.w500,
                //                                 fontSize: Dimensions.font12
                //                             ),),
                //
                //                             Text(" • ",style: TextStyle(
                //                               color: ThemeColors.fontColor2,
                //                               fontWeight: FontWeight.w800,
                //                               fontSize: Dimensions.font12,
                //                             ),),
                //
                //                             Text("posted on: Oct 29,2023",style: TextStyle(
                //                                 color: ThemeColors.fontColor2,
                //                                 fontWeight: FontWeight.w400,
                //                                 fontSize: Dimensions.font12
                //                             ),)
                //                           ],
                //                         ),
                //                       ],),
                //                   )
                //                 ],
                //               ),
                //             )
                //         ),
                //       );
                //     }),
                SizedBox(height: Get.height*0.2,)
              ],
            ),
          );
        }
      ),

    );
  }
}
