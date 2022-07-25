import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/const/appcolors.dart';

class AppStyles{
 static BoxDecoration OnboardingCardDecoration=BoxDecoration(
      color: AppColors.scaffoldColor,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: [
        BoxShadow(
          offset: Offset(4.0, 4.0),
          blurRadius: 10,
          spreadRadius: 1.0,
          color: Colors.black26,
        ),
        BoxShadow(
          offset: Offset(-4.0, -4.0),
          blurRadius: 5,
          spreadRadius: 1.0,
          color: Colors.white,
        ),
        BoxShadow(
          offset: Offset(5, -5),
          blurRadius: 13,
          spreadRadius: 0,
          color: Color(0xFFD2D5D8).withOpacity(0.2),
        ),
        BoxShadow(
          offset: Offset(-1, -1),
          blurRadius: 2,
          spreadRadius: 0,
          color: Color(0xFFD2D5D8).withOpacity(0.5),
        ),
        BoxShadow(
          offset: Offset(1, 1),
          blurRadius: 2,
          spreadRadius: 0,
          color: Color(0xFFFFFFFF).withOpacity(0.3),
        ),

      ]
  );

 static BoxDecoration OnboardingButtonDecoration=BoxDecoration(
      color: AppColors.scaffoldColor,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: [
        BoxShadow(
          offset: Offset(4.0, 4.0),
          blurRadius: 13,
          spreadRadius: 0,
          color: Color(0xFFD2D5D8).withOpacity(0.9),
        ),
        BoxShadow(
          offset: Offset(-4.0, -4.0),
          blurRadius: 10,
          spreadRadius: 0,
          color: Colors.white.withOpacity(0.9),
        ),
        BoxShadow(
          offset: Offset(5, -5),
          blurRadius: 10,
          spreadRadius: 0,
          color: Color(0xFFD2D5D8).withOpacity(0.2),
        ),
        BoxShadow(
          offset: Offset(-5, 5),
          blurRadius: 10,
          spreadRadius: 0,
          color: Color(0xFFD2D5D8).withOpacity(0.2),
        ),
        BoxShadow(
          offset: Offset(-1, -1),
          blurRadius: 2,
          spreadRadius: 0,
          color: Color(0xFFD2D5D8).withOpacity(0.5),
        ),
        BoxShadow(
          offset: Offset(1, 1),
          blurRadius: 2,
          spreadRadius: 0,
          color: Color(0xFFFFFFFF).withOpacity(0.3),
        ),


      ]
  );


 static TextStyle kTitleStyles=TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
 static TextStyle kDescriptionStyles=TextStyle(
    fontSize: 20.sp,
    color: Colors.black,
  );
 static TextStyle kAlreadyANUSerLoginStyle=TextStyle(
   fontSize: 18,
   fontWeight: FontWeight.w300,
   color: AppColors.blackColor,
 );
 static TextStyle kLoginStyle=TextStyle(
   fontSize: 18,
   fontWeight: FontWeight.w600,
   color: AppColors.mainColor,
 );

}
