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

class SignInScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

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
              BigText(text: "Login\nTo Your Account", size: 36.sp),
              SizedBox(
                height: 50.h,
              ),
              ReuseTextFormField(
                text: "E-mail Address",
                controller: _emailController,
              ),
              ReuseTextFormField(
                text: "Enter Password",
                controller: _passController,
              ),
              SizedBox(
                height: 80.h,
              ),
              ReuseAblebutton(
                text: "Login",
                onAction: () {
                  Auth().LogIn(
                      _emailController.text, _passController.text, context);
                  Get.toNamed(mainhomescreen);
                },
              ),
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
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/images/facebook .png",
                      height: 23.h,
                      width: 23.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/images/google.png",
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
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Don’t have registered yet?",
                      style: AppStyles.kAlreadyANUSerLoginStyle),
                  TextSpan(
                      text: " Sign Up",
                      style: AppStyles.kLoginStyle,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.toNamed(signup)),
                ])),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
