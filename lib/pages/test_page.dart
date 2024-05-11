import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_shore/main.dart';

import '../helper/navigator_object.dart';
import '../lists.dart';
import '../theme/dimensions.dart';
import '../theme/theme_colors.dart';

Future<List<String>> getUserInterests() async {
  try {
    final snapshot = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
    if (snapshot.exists) {
      final data = snapshot.data();
      if (data != null && data.containsKey('interests')) {
        final List<String> interests = List<String>.from(data['interests']);
        return interests;
      }
    }

    return [];
  } catch (e) {
    print('Error getting user interests: $e');
    return [];
  }
}

Future<List<Map<String, dynamic>>> getTopPostsForCategory(String category) async {
  try {
    final snapshot = await FirebaseFirestore.instance.collection('interests').doc(category.toLowerCase()).collection(DateTime.now().year.toString()).limit(10).get();
    final posts = snapshot.docs.map((doc) => doc.data()).toList();
    return posts;
  } catch (e) {
    print('Error getting top posts for category $category: $e');
    return [];
  }
}
class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: FutureBuilder<List<String>>(
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
                          padding: EdgeInsets.all(8.0),
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
                                        schemeData: schemeData1,
                                        child: Padding(
                                        padding: EdgeInsets.only(top:Dimensions.height8,left: Dimensions.width15,right: Dimensions.width15,bottom: Dimensions.height6),
                                    child: Container(
                                    decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                                    ),
                                    width: Dimensions.screenWidth*0.95,
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
                                    Text("${post["title"]}",overflow: TextOverflow.ellipsis,style: TextStyle(
                                    color: ThemeColors.fontColor2,fontWeight: FontWeight.w400
                                    ),
                                    ),
                                    SizedBox(height: Dimensions.height10,),
                                    SizedBox(
                                    width: Dimensions.screenWidth*0.4,
                                    child: Text("${post['description']}",maxLines: 2,overflow: TextOverflow.ellipsis,
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
                                    Text("${post["posted_by"]}",style: TextStyle(
                                    color: ThemeColors.fontColor2,
                                    fontWeight: FontWeight.w500,
                                    fontSize: Dimensions.font12
                                    ),),

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
    );
  }
}
