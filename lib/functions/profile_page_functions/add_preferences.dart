import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:scholar_shore/constants/dbconstants.dart';

void add_preferences({required interest_list})async{
  try{

    await firebase_instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid.toString()).update({"interests":interest_list});
  }
  on Exception catch (e){
    Get.snackbar("Error","$e");
  }

}