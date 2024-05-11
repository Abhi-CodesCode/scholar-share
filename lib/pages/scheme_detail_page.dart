import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_shore/theme/dimensions.dart';

import '../widgets/app_icons.dart';
import '../widgets/big_text.dart';
import '../widgets/expandable_text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SchemeDetailPage extends StatelessWidget {
  final Map<String, dynamic>? schemeData;
  const SchemeDetailPage({Key? key, required this.schemeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (schemeData == null || schemeData!.isEmpty || schemeData!['post_image'] == null) {
      // Handle the case where schemeData is null or empty
      //print("${schemeData!['image']} is the imageeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      return Scaffold(
        body: Center(
          child: Text("Scheme data is null or empty"),
        ),
      );
    }

    String title = schemeData!['title'] as String? ?? "";
    String description = schemeData!['description'] as String? ?? "";


    var eligibilityText = schemeData!['criteria'] ?? "None specified";
    var requirements = schemeData!['requirements']  ?? "None specified";

    return Scaffold(
      body: Stack(
        children: [
          // Main Image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Get.height*0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.network(schemeData!["post_image"]).image,
                ),
              ),
            ),
          ),
          // Buttons - Back button and Tag button
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: (Dimensions.height40 * 2)/2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 IconButton(style:IconButton.styleFrom(backgroundColor: Colors.grey.withOpacity(0.4)),
                    icon: Icon(Icons.arrow_back, size: 30,
                      
                    ),

                  onPressed: () {
                    Get.back();
                  }),
                IconButton(style:IconButton.styleFrom(backgroundColor: Colors.grey.withOpacity(0.4)),
                    icon: Icon(Icons.bookmark_border_outlined, size: 30,

                    ),

                    onPressed: () {
                      Get.back();
                    }),
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
                          BigText(text: title),
                          SizedBox(
                            height: Dimensions.height8,
                          ),
                          ExpandableTextWidget(
                            text: description,
                            eligibilityText: eligibilityText,
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
          Positioned(
            bottom: 0,
            child: Container(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UnconstrainedBox(
                    child: Padding(
                      padding: EdgeInsets.only(top: Dimensions.height8),
                      child: TextButton(
                        onPressed: () {Get.snackbar("Success", "Reported.");},
                        child: Row(
                          children: [
                            Icon(Icons.report, color: Colors.black87, size: Dimensions.iconSize16),
                            Text(
                              " Report content",
                              style: TextStyle(color: Colors.black87, fontSize: Dimensions.font14),
                            ),
                          ],
                        ),
                        //style: ElevatedButton.styleFrom(backgroundColor: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                      ),
                    ),
                  ),
                  UnconstrainedBox(
                    child: Center(
                      child: SizedBox(
                        height: Dimensions.height40 * 1.5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.width8),
                          child: TextButton(
                            onPressed: () async{
                             var url= Uri.parse(schemeData!["link"]);

                             if(url!=''){
                               await launchUrl(
                                 url,
                                 mode: LaunchMode.inAppBrowserView,
                               );
                             }
                             else{
                               Get.snackbar("No links for this post", "The post provider has not provided any links");
                             }






                              },
                            child: Padding(
                              padding: EdgeInsets.all(Dimensions.width6),
                              child: Row(
                                children: [
                                  Text("Visit ", style: TextStyle(fontSize: Dimensions.font20, color: Colors.black87)),
                                  Icon(Icons.open_in_new, color: Colors.black)
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
            ),
          ),
        ],
      ),
    );
  }
}
