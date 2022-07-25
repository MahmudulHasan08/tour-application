import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour/business_logics/auth.dart';
import 'package:tour/ui/route/routes.dart';
import 'package:tour/ui/styles/styles.dart';
import 'package:tour/ui/widgets/button.dart';
import 'package:tour/ui/widgets/text.dart';
import 'package:tour/ui/widgets/textfield.dart';

class SignUpScreen extends StatelessWidget {

  TextEditingController _emailController=TextEditingController();
  TextEditingController _passController=TextEditingController();
  TextEditingController _numberController=TextEditingController();
  final fromKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 40.w, right: 60.w, top: 80),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: "Create\nYour Account", size: 36.sp),
              SizedBox(
                height: 12.h,
              ),
              SmallText(text: "Create your account and start your journey"),
              SizedBox(
                height: 50.h,
              ),
              Form(
                  key: fromKey,
                  child: Column(
                children: [
                  ReuseTextFormField(text: "E-mail Address",controller: _emailController,
                    validator: (value){
                    if(value!.isEmpty){
                      return "Enter the valid email";
                    }
                    else
                      {
                        return null;
                      }
                    }, ),
                  ReuseTextFormField(text: "Enter Password",controller: _passController,
                  validator: (value){
                    if(value!.isEmpty || RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>').hasMatch(value)){
                      return "Enter the valid password";
                    }else{
                      return null;
                    }
                  },
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  ReuseAblebutton(
                    text: "Create Account",
                    onAction: (){
                      if(fromKey.currentState!.validate()){
                        Auth().registraton(_emailController.text, _passController.text, context);
                      }
                    },
                  ),
                ],
              )),
              SizedBox(
                height: 17.h,
              ),
              Align(
                alignment: Alignment.center,
                child: SmallText(text: "--OR--"),
              ),
              SizedBox(
                height: 17.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                     Auth().signInWithFacebook();
                    },
                    icon: Image.asset(
                      "assets/images/facebook .png",
                      height: 23.h,
                      width: 23.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Auth().signInWithGoogle(context);
                    },
                    icon: Image.asset(
                      "assets/images/google.png",
                      height: 23.h,
                      width: 23.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.defaultDialog(
                        content: Container(
                          child: 
                          Column(
                            children: [
                              TextField(
                                controller: _numberController,
                                decoration: InputDecoration(
                                  hintText: "Enter Your Phone Number",
                                  
                                ),
                              ),
                              SizedBox(height: 15.h,),
                              ReuseAblebutton(text: "Continue", onAction: (){
                                Auth().verifyPhoneNumbe(_numberController.text, context);
                              })
                            ],
                          ),
                        )
                      );
                    },
                    icon: Image.asset(
                      "assets/images/phone.png",
                      height: 23.h,
                      width: 23.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 17.h,
              ),
              Align(
                alignment: Alignment.center,
                child: RichText(text: TextSpan(
                  children: [
                    TextSpan(text: "Already an user?",style: AppStyles.kAlreadyANUSerLoginStyle),
                    TextSpan(text: " Log In",style: AppStyles.kLoginStyle,
                        recognizer:  TapGestureRecognizer()..onTap=()=>Get.toNamed(signin)),
                  ]
                )),
              )

            ],
          ),
        ),
      ),
    ));
  }
}
