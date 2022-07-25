import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:lottie/lottie.dart';
import 'package:tour/business_logics/auth.dart';
import 'package:tour/ui/route/routes.dart';
import 'package:tour/ui/styles/styles.dart';
import 'package:tour/utils/const/appcolors.dart';
import 'package:tour/utils/const/appfiles.dart';
import 'package:tour/utils/const/appstrings.dart';

class OnboardingScreen extends StatelessWidget {

  List<String> title = [
    AppStrings.onboardingTitle1,
    AppStrings.onboardingTitle2,
    AppStrings.onboardingTitle3,
  ];
  List<String> description = [
    AppStrings.onboardingDescription,
    AppStrings.onboardingDescription,
    AppStrings.onboardingDescription,
  ];
  List<String> _lottieFiles = [
    AppFiles.welcome,
    AppFiles.support,
    AppFiles.categories,
  ];
  RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Obx(()=>Expanded(
            flex: 5,
            child: Lottie.asset(
              _lottieFiles[currentIndex.toInt()],
            ),
          ),),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(30.w),
              child: Container(
                padding: EdgeInsets.all(20.w),
                decoration: AppStyles.OnboardingCardDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(()=>Text(
                      title[currentIndex.toInt()],
                      style: AppStyles.kTitleStyles,
                    ),),

                    SizedBox(
                      height: 15.h,
                    ),
                    Obx(()=>Text(
                      description[currentIndex.toInt()],
                      style: AppStyles.kDescriptionStyles,
                    ),),

                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(()=>DotsIndicator(
                          dotsCount: _lottieFiles.length,
                          position: currentIndex.toDouble(),
                          decorator: DotsDecorator(
                            color: Color(0xFF737077),
                            // Inactive color
                            activeColor: Colors.black,
                          ),
                        ),),
                        InkWell(
                          onTap: () {
                            Auth().storedOnboardingInfo();
                            if(currentIndex==_lottieFiles.length-1){
                              Get.toNamed(signup);
                              print(_lottieFiles.length);
                            }else{
                              currentIndex++;
                            }

                          },
                          child: Container(
                            height: 37.h,
                            width: 37.w,
                            decoration: AppStyles.OnboardingButtonDecoration,
                            child: Icon(
                              Icons.fast_forward_outlined,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
