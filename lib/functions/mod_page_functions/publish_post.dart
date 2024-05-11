// ignore_for_file: unused_local_variable, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:scholar_shore/constants/dbconstants.dart';

void publish_post({
  required title,
  required description,
  required criteria,
  required link,
  required category,
  required String image,
  required String organization_name,
  var last_date='' }) async{

  String imageUrl = '';
  var firestore = firebase_instance;

  try{
    firestore.collection('interests').doc(category.toLowerCase()).collection(DateTime.now().year.toString()).add({
      "title":title,
      "description":description,
      "criteria":criteria,
      "link": link,
      "last_date":last_date,
      "posted_by": "ScholarShore",
      "organization_name": organization_name,
      "posted_on": DateTime.now(),
      "post_image": image
    });
    Get.snackbar("Successfully added the post! ", "Happy sir?");
  }
  on Exception catch (e){
    Get.snackbar("Error", "$e");
  }
}
