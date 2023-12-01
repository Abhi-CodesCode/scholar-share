import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_shore/helper/navigator_object.dart';
import 'package:scholar_shore/lists.dart';
import 'package:scholar_shore/pages/explore_page.dart';
import 'package:scholar_shore/theme/dimensions.dart';
import 'package:scholar_shore/theme/theme_colors.dart';
import 'package:scholar_shore/widgets/app_icons.dart';

import '../widgets/app_buttons.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> schemeData1={'schemeName': "hello world", 'description': "namasteIndia", 'image':'assets/images/carousel/code_screen1.jpg'};

    int currentIndex=0;
    CarouselController carouselController = CarouselController();
    CarouselController dotsController = CarouselController();
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          scrolledUnderElevation: 0,
          toolbarHeight: Dimensions.appBarHeight,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.all(Dimensions.height6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcons(icon: Icon(Icons.menu)),
                Row(
                  children: [
                    GestureDetector(child: AppButtons(icon: Icon(Icons.search,)),onTap: (){},),
                    SizedBox(width: Dimensions.width8,),
                    AppButtons(icon: Icon(Icons.notifications,))
                  ],
                )
              ],
            ),
          )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top:Dimensions.height15,left:Dimensions.height20,bottom: Dimensions.height12,right: Dimensions.height12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Trending Now",style: TextStyle(fontWeight: FontWeight.w600,fontSize: Dimensions.font24),
                  ),
                  CupertinoButton(onPressed: (){}, child: Text("View All",style: TextStyle(color: ThemeColors.accentColor,fontWeight: FontWeight.w600,fontSize: Dimensions.font14),))
                ],
              ),
            ),
            CarouselSlider(
              carouselController: carouselController,
              items: MyImages.imgList.map<Widget>((item) => NavigatorObject(
                schemeData: schemeData1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width8/2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      image: DecorationImage(image:AssetImage(item),fit: BoxFit.cover,)
                  ),
                ),
              )).toList(), options: CarouselOptions(
                height: Dimensions.carouselHeight,
                viewportFraction: 0.87,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                initialPage: 0,
                autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                onPageChanged: (index,reason){
                  // This will update the dots indicator
                }
            ),
            ),
            Padding(
              padding: EdgeInsets.only(top:Dimensions.height15,left:Dimensions.height20,bottom: Dimensions.height12,right: Dimensions.height12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("For You",style: TextStyle(fontWeight: FontWeight.w600,fontSize: Dimensions.font24),
                  ),
                  CupertinoButton(onPressed: (){}, child: Text("View All",style: TextStyle(color: ThemeColors.accentColor,fontWeight: FontWeight.w600,fontSize: Dimensions.font14),))
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount:MyImages.imgList.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder:
                    (BuildContext context, int index){
                  return NavigatorObject(
                    schemeData: schemeData1,
                    child: Padding(
                        padding: EdgeInsets.only(top:Dimensions.height8,left: Dimensions.width15,right: Dimensions.width15,bottom: Dimensions.height6),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            // boxShadow: const [
                            //   BoxShadow(
                            //     blurRadius: 5.0,
                            //     color: Color(0xFFe8e8e8),
                            //     offset: Offset(0, 5),
                            //   ),
                            //   BoxShadow(
                            //     blurRadius: 5.0,
                            //     color: Color(0xFFe8e8e8),
                            //     offset: Offset(0, -5),
                            //   ),
                            //   BoxShadow(
                            //     blurRadius: 5.0,
                            //     color: Color(0xFFe8e8e8),
                            //     offset: Offset(-5, 0),
                            //   ),
                            //   BoxShadow(
                            //     blurRadius: 5.0,
                            //     color: Color(0xFFe8e8e8),
                            //     offset: Offset(5, 0),
                            //   ),
                            //   BoxShadow(
                            //     blurRadius: 5.0,
                            //     color: Colors.white, // White shadow for the inside
                            //     offset: Offset(0, 0), // No offset to keep it inside
                            //   ),
                            // ],
                          ),
                          width: Dimensions.screenWidth*0.95,
                          child: Row(
                            children: [
                              Container(
                                  width:Dimensions.listImageHeight,
                                  height:Dimensions.listImageHeight,
                                  decoration:BoxDecoration(borderRadius:BorderRadius.circular(Dimensions.radius20),image: DecorationImage(image: AssetImage(MyImages.imgList[index]),fit: BoxFit.cover,))),
                              Padding(
                                padding: EdgeInsets.all(Dimensions.height8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Hello",style: TextStyle(
                                        color: ThemeColors.fontColor2,fontWeight: FontWeight.w400
                                    ),
                                    ),
                                    SizedBox(height: Dimensions.height10,),
                                    SizedBox(
                                      width: Dimensions.screenWidth*0.4,
                                      child: const Text("Well who's the boss now bitch, Come say hi to your dad now bitch",maxLines: 2,overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 18 ,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: Dimensions.height8,),

                                    Row(
                                      children: [
                                        CircleAvatar(backgroundImage: AssetImage(MyImages.imgList[index]),radius:Dimensions.radius12,),
                                        SizedBox(width: Dimensions.width6,),
                                        Text("UserName",style: TextStyle(
                                          color: ThemeColors.fontColor2,
                                          fontWeight: FontWeight.w500,
                                          fontSize: Dimensions.font12
                                        ),),

                                        Text(" • ",style: TextStyle(
                                            color: ThemeColors.fontColor2,
                                            fontWeight: FontWeight.w800,
                                            fontSize: Dimensions.font12,
                                        ),),

                                        Text("Oct 29,2023",style: TextStyle(
                                          color: ThemeColors.fontColor2,
                                          fontWeight: FontWeight.w400,
                                          fontSize: Dimensions.font12
                                        ),)
                                      ],
                                    ),
                                  ],),
                              )
                            ],
                          ),
                        )
                    ),
                  );
                }),
            SizedBox(height: Dimensions.height15,)
          ],
        ),
      ),

    );
  }
}
