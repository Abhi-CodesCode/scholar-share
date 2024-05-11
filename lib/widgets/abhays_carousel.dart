import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_shore/pages/scheme_detail_page.dart';

import '../functions/home_page_functions/get_user_interests.dart';



class AbhaysCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: getPostsFromFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final posts = snapshot.data;
          if (posts != null && posts.isNotEmpty) {
            return CarouselSlider(
              items: posts.map<Widget>((post) {
                String imageUrl = post['post_image']; // Assuming 'image' is the field in your post document that contains the image URL
                return GestureDetector(
                  onTap: () {
                    Get.to(() => SchemeDetailPage(schemeData: post));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 200.0,
                viewportFraction: 0.87,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                initialPage: 0,
                autoPlayCurve: Curves.fastOutSlowIn,
                onPageChanged: (index, reason) {
                  // This will update the dots indicator
                },
              ),
            );
          } else {
            return Center(child: Text('No posts found.'));
          }
        }
      },
    );
  }
}
