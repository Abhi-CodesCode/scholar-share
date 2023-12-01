import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_shore/theme/theme_colors.dart';

import '../theme/dimensions.dart';
import '../widgets/app_icons.dart';
import '../widgets/big_text.dart';
import '../widgets/expandable_text_widget.dart';


class SchemeDetailPage extends StatelessWidget {
  final Map<String, dynamic> schemeData;

  const SchemeDetailPage({super.key, required this.schemeData});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          // Main Image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.imageHeight,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/carousel/code_screen1.jpg"
                  ),
                ),
              ),
            ),
          ),
          // Buttons - Back button and Tag button
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: (Dimensions.height40 * 5) / 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: AppIcons(
                    icon: Icon(Icons.arrow_back),
                    size: 42,
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
                GestureDetector(
                  child: AppIcons(
                    icon: const Icon(Icons.bookmark_border_outlined,size: 35,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Scheme Details
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.imageHeight - Dimensions.height15,
            child: Container(
              height: Dimensions.screenHeight / 2.1,
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20),
                  topRight: Radius.circular(Dimensions.radius20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimensions.width6,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: 'title'),
                          SizedBox(
                            height: Dimensions.height8,
                          ),
                          ExpandableTextWidget(
                            text: 'description',
                          ),
                        ],
                      ),
                    ),
                  ),
               
                ],
              ),
            ),
          ),
          Positioned(bottom: 0,child: Container(
            height: Dimensions.bottomBarHeight,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.height20,
              horizontal: Dimensions.width15,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffE5E5E5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius30),
                topRight: Radius.circular(Dimensions.radius30),
              ),
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UnconstrainedBox(child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextButton(onPressed: (){}, child: Row(
                    children: [
                      Icon(Icons.report,color: Colors.black87,size: 17,),
                      Text(" Report content",style: TextStyle(color: Colors.black87,fontSize: 16),),
                    ],
                  ),
            //style: ElevatedButton.styleFrom(backgroundColor: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            ),
                )),
                UnconstrainedBox(
                  child: Center(
                    child: SizedBox(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextButton(
                          onPressed: () {  },
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              children: [
                                Text("Visit ",style: TextStyle(fontSize: 20,color: Colors.black87),),
                                Icon(Icons.open_in_new,color: Colors.black,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),)
        ],
      ),
    
    );
  }
}