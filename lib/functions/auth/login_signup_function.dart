

// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_shore/main.dart';
import 'package:scholar_shore/pages/mod_page.dart';

import '../../pages/home.dart';

void login({required email, required password})async{
  try{
    var x=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

    if(x.user!.email!='mod@gmail.com'){
      Get.offAll(MyApp());
    }
    else{
      Get.offAll(ModPage());
    }
  }
  on Exception catch (e){


    if(e.toString() == "[firebase_auth/invalid-credential] The supplied auth credential is incorrect, malformed or has expired."){
      Get.snackbar("Error 404:", "Credentials not found! check your credentials again human. 🕵️‍♂️🔍",duration: Duration(seconds: 9),backgroundColor: Colors.black, colorText: Colors.white);
    }
    else{
      Get.snackbar("Error", "Hmm, well we suspect something is wrong! consider reporting it to scholar share defenders.", duration: Duration(seconds: 9),backgroundColor: Colors.black, colorText: Colors.white);
    }
  }






}
void sign_up({required email, required password, required username}) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    final uid = user!.uid;

    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).set({"username": username});
      if (user.email != 'mod@gmail.com') {
        Get.offNamed('/preferences');
      } else {
        Get.off(ModPage());
      }
    } catch (e) {
      Get.snackbar("Error while creating user", "$e");
    }
  } catch (e) {
    //print("something went wrong: $e");
    if(e.toString() == "[firebase_auth/email-already-in-use] The email address is already in use by another account."){
      Get.snackbar("Oops!", "Email déjà vu! 😵‍💫 This email is already in use human, login if it's an  Email déjà vu!  ",dismissDirection: DismissDirection.horizontal, duration: Duration(seconds: 9));
    }
    //Get.dialog(Dialog(child: Container(child: Text("An error occurred while signing up \n $e"),),));
  }
}

void logout()async{
  await FirebaseAuth.instance.signOut();
  Get.offAllNamed("/signup");

}