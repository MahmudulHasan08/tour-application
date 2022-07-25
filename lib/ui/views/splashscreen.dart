import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tour/business_logics/auth.dart';
import 'package:tour/ui/route/routes.dart';
import 'package:tour/utils/const/appstrings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();
  int? isViewed;
  int? isViewedPrivacy;

  chooseScreen() {
    var userId = box.read("uid");
    var userdataInfo = box.read("uID");
    if (userdataInfo != null &&
        isViewed == 0 &&
        userId != null &&
        isViewedPrivacy == 0) {
      Get.toNamed(mainhomescreen);
    } else if (userdataInfo != null && isViewed == 0 && userId != null) {
      Get.toNamed(privacy);
    } else if (isViewed == 0 && userId != null) {
      Get.toNamed(userform);
    } else if (isViewed == 0 && userId == null) {
      Get.toNamed(signup);
    } else if (isViewed != 0) {
      Get.toNamed(onboarding);
    }
  }

  //stored_onboarding_screen_Get_data
  loadisViewed() async {
    final prefs = await SharedPreferences.getInstance();
    isViewed = await prefs.getInt("onboard");
  }

  //Stroed_privacy_screen_Get_data
  loadisViewedPrivacy() async {
    final prefs = await SharedPreferences.getInstance();
    isViewedPrivacy = await prefs.getInt("privacy");
  }

  @override
  void initState() {
    loadisViewed();
    loadisViewedPrivacy();
    Future.delayed(
      Duration(seconds: 3),
      () => chooseScreen(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 100.w,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                AppStrings.appName,
                style: TextStyle(fontSize: 20.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
