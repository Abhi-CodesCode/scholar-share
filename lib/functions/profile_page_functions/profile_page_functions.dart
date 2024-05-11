

// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/dbconstants.dart';

Future<String> get_user_details() async {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  print("User uid is: $uid");

  var snapshot = await firebase_instance.collection('users').doc(uid).get();

  if (snapshot.exists) {
    Map<String, dynamic> data = snapshot.data()!;
    if (data.containsKey('username') && data['username'] != null) {
      String username = data['username'];
      print("username is: $username");
      return username;
    } else {
      return "Username not found";
    }
  } else {
    return "User not found";
  }
}



void update_profile({full_name, email, password}) async{
  if(full_name!=''){
    try{
      await firebase_instance.collection('users').doc(uid).update({"fullname":full_name});
      Get.snackbar("Success", "Refresh to see changes");
    }
    on Exception catch (e){

        GetSnackBar(
          title: 'Something went wrong',
          message: e.toString(),
          icon: const Icon(Icons.error_outline_sharp),
          duration: const Duration(seconds: 3),
        );

    }

  }


  if(email!=''){
    try{
      await FirebaseAuth.instance.currentUser?.updateEmail(email);

    }
    on Exception catch (e){

      GetSnackBar(
        title: 'Something went wrong',
        message: e.toString(),
        icon: const Icon(Icons.error_outline_sharp),
        duration: const Duration(seconds: 3),
      );


    }

  }


  if(password!=''){
    try{
      await FirebaseAuth.instance.currentUser!.updatePassword(password);
    }
    on Exception catch (e){

      GetSnackBar(
        title: 'Something went wrong',
        message: e.toString(),
        icon: const Icon(Icons.error_outline_sharp),
        duration: const Duration(seconds: 3),
      );

    }

  }

}