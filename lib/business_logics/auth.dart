import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tour/ui/widgets/button.dart';
import 'package:tour/utils/const/appcolors.dart';

import '../ui/route/routes.dart';

class Auth {
  TextEditingController _numController = TextEditingController();

  final box = GetStorage();
  int? isViewed;
  int? isViewedPrivacy;

  //choosescreen

  //stored_onboarding_screen_Set_data
  storedOnboardingInfo() async {
    int isViewed = 0;
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("onboard", isViewed);
  }

  //registration
  Future registraton(String email, String pass, context) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      var authcredential = credential.user;
      if (authcredential!.uid.isNotEmpty) {
        Fluttertoast.showToast(msg: "Registration Successfully");
        box.write("uid", authcredential.uid);
        Get.toNamed(userform);
      } else {
        Fluttertoast.showToast(msg: "Registration failed");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error is : $e");
    }
  }

  //login
  Future LogIn(String email, String pass, context) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      var authcredential = credential.user;
      if (authcredential!.uid.isNotEmpty) {
        Fluttertoast.showToast(msg: "Login Successfully");
        Get.toNamed(mainhomescreen);
      } else {
        Fluttertoast.showToast(msg: "Login failed");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error is : $e");
    }
  }

  //facebook
  Future signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      UserCredential credential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      User? user = credential.user;
      if (user!.uid.isNotEmpty) {
        Fluttertoast.showToast(
            backgroundColor: AppColors.mainColor,
            textColor: AppColors.whiteColor,
            msg: "Successfully done");
        Get.toNamed(userform);
      } else {
        Fluttertoast.showToast(
            backgroundColor: AppColors.mainColor,
            textColor: AppColors.whiteColor,
            msg: "failed");
      }
    } catch (e) {
      Fluttertoast.showToast(
          backgroundColor: AppColors.mainColor,
          textColor: AppColors.whiteColor,
          msg: "Erron is $e");
    }
  }

  //google
  Future signInWithGoogle(context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential _userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = _userCredential.user;
      if (user!.uid.isNotEmpty) {
        Fluttertoast.showToast(
          backgroundColor: AppColors.mainColor,
          textColor: AppColors.whiteColor,
          msg: "Google SignIn Successfully",
        );
        Get.toNamed(userform);
      } else {
        Fluttertoast.showToast(
          backgroundColor: AppColors.mainColor,
          textColor: AppColors.whiteColor,
          msg: "Something is Worng",
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        backgroundColor: AppColors.mainColor,
        textColor: AppColors.whiteColor,
        msg: "Erron is $e",
      );
    }
  }

  //phone number
  verifyPhoneNumbe(number, context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (PhoneAuthCredential credential) async {
        UserCredential userCredential =
            await auth.signInWithCredential(credential);
        User? user = userCredential.user;
        if (user!.uid.isNotEmpty) {
          Fluttertoast.showToast(
              backgroundColor: AppColors.mainColor,
              textColor: AppColors.whiteColor,
              msg: "phone verification successfully done");
          Get.toNamed(userform);
        } else {
          Fluttertoast.showToast(
              backgroundColor: AppColors.mainColor,
              textColor: AppColors.whiteColor,
              msg: "failed");
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text("Enter Your OTP"),
                content: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Container(
                    child: Column(
                      children: [
                        TextField(
                          controller: _numController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Enter Your Code",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ReuseAblebutton(
                            text: "Continue",
                            onAction: () async {
                              PhoneAuthCredential _phnAuthcredential =
                                  PhoneAuthProvider.credential(
                                      verificationId: verificationId,
                                      smsCode: _numController.text);
                              UserCredential credential = await auth
                                  .signInWithCredential(_phnAuthcredential);
                              User? user = credential.user;
                              if (user!.uid.isNotEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Successfully done");
                                Get.toNamed(userform);
                              } else {
                                Fluttertoast.showToast(
                                    backgroundColor: AppColors.mainColor,
                                    textColor: AppColors.whiteColor,
                                    msg: "Failed");
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              );
            });

        // Create a PhoneAuthCredential with the code

        // Sign the user in (or link) with the credential
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  //Stroed_privacy_screen_Set_data
  storedPrivacyInfo() async {
    int isViewedPrivacy = 0;
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("privacy", isViewedPrivacy);
  }
}
