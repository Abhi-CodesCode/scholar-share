import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_shore/theme/theme_colors.dart';

import '../theme/dimensions.dart';
import '../widgets/app_icons.dart';
import '../widgets/big_text.dart';
import '../widgets/expandable_text_widget.dart';

List<String> eligibilityText=[
  'the eligibility 1',
  'the eligibility 2',
  'the eligibility 3',
  'the elegibility 4'
];

List<String> requirements=[
  'the requirement 1',
  'the requirement 2',
  'the requirement 3',
];
class SchemeDetailPage extends StatelessWidget {
  final Map<String, dynamic> schemeData;
  const SchemeDetailPage({super.key, required this.schemeData});


  @override
  Widget build(BuildContext context) {


    String title=schemeData['title'];
    String description=schemeData['description'];
    String img=schemeData['image'];

    if (schemeData == null) {
      // Handle the case where schemeData is null
      return Scaffold(
        body: Center(
          child: Text("Scheme data is null"),
        ),
      );
    }

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
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(img),
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
                    size: Dimensions.iconSize30,
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
                GestureDetector(
                  child: AppIcons(
                    icon: Icon(Icons.bookmark_border_outlined,size: Dimensions.iconSize30,
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
                          BigText(text: title,),
                          SizedBox(
                            height: Dimensions.height8,
                          ),
                          ExpandableTextWidget(
                            text: description,
                            elegibiltyCrit: eligibilityText,
                            requirements: requirements,
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          )
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
                  padding: EdgeInsets.only(top: Dimensions.height8),
                  child: TextButton(onPressed: (){}, child: Row(
                    children: [
                      Icon(Icons.report,color: Colors.black87,size: Dimensions.iconSize16,),
                      Text(" Report content",style: TextStyle(color: Colors.black87,fontSize: Dimensions.font14),),
                    ],
                  ),
            //style: ElevatedButton.styleFrom(backgroundColor: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            ),
                )),
                UnconstrainedBox(
                  child: Center(
                    child: SizedBox(
                      height: Dimensions.height40*1.5,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.width8),
                        child: TextButton(
                          onPressed: () {  },
                          child: Padding(
                            padding: EdgeInsets.all(Dimensions.width6),
                            child: Row(
                              children: [
                                Text("Visit ",style: TextStyle(fontSize: Dimensions.font20,color: Colors.black87),),
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