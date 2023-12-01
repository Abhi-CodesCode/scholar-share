import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../lists.dart';
import '../theme/dimensions.dart';
import '../theme/theme_colors.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {

    CarouselController carouselController = CarouselController();
    CarouselController dotsController = CarouselController();
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
                CupertinoButton(onPressed: (){}, child: Text("View All",style: TextStyle(color: ThemeColors.accentColor,fontWeight: FontWeight.w600,fontSize: Dimensions.font14),))
              ],
            ),
          ),
          CarouselSlider(
            carouselController: carouselController,
            items: MyImages.imgList.map<Widget>((item) => Container(
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width8/2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  image: DecorationImage(image:AssetImage(item),fit: BoxFit.cover,)
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
                return Padding(
                    padding: EdgeInsets.only(top:Dimensions.height8,left: Dimensions.width15,right: Dimensions.width6,bottom: Dimensions.height6),
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
                              Container(
                                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width<500? MediaQuery.of(context).size.width*0.5:500),
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
                                    fontWeight: FontWeight.w400,
                                  ),),

                                  Text(" • ",style: TextStyle(
                                      color: ThemeColors.fontColor2,
                                      fontWeight: FontWeight.w800,
                                      fontSize: Dimensions.font20
                                  ),),

                                  Text("Oct 29,2023",style: TextStyle(
                                    color: ThemeColors.fontColor2,
                                    fontWeight: FontWeight.w400,
                                  ),)
                                ],
                              )

                            ],),
                        )
                      ],
                    )
                );
              })
        ],
      ),
    );
  }
}
