import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour/ui/route/routes.dart';
import 'package:tour/ui/widgets/drawer.dart';
import 'package:tour/utils/const/appcolors.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 26.w, top: 45.h, bottom: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shelter",
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Travel Agency",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              drawer("Support", () => Get.toNamed(supportscreen)),
              drawer("Privacy", () => Get.toNamed(privacyscreen)),
              drawer("FAQ", () => Get.toNamed(faqscreen)),
              drawer("Rate Us", () {}),
              drawer("How To Use", () => Get.toNamed(howtousescreen)),
              Expanded(child: Container()),
              InkWell(
                onTap: () => Get.toNamed(settingsscreen),
                child: Text(
                  "Settings",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
