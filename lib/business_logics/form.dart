import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../ui/route/routes.dart';

class UserInfo{
  final box = GetStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  sendFormDatatoDB(String name,int phone,String address,String dob,String gender)async{
  try{
    CollectionReference _course=FirebaseFirestore.instance.collection("user-form-data");
    _course.doc(_auth.currentUser!.email).set({
      "Name" : name,
      "Phone":phone,
      "Address":address,
      "Date of Birth":dob,
      "Gender":gender,

    })..whenComplete(() {
      var _authcurrenUser = _course.id;
      var userId = box.write("uID", _authcurrenUser);
      print("course id $_authcurrenUser");
      Fluttertoast.showToast(msg: "Added Successfully");
      Get.toNamed(privacy);
    });
  }catch(e){
    Fluttertoast.showToast(msg: "error: $e");
  }
}
}