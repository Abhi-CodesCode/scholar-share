
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

var auth = FirebaseAuth.instance;
User? user = auth.currentUser;
var uid = user!.uid;
var firebase_instance=FirebaseFirestore.instance;