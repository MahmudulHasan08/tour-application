import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour/utils/const/appcolors.dart';


//small text

class SmallText extends StatelessWidget {
  final String text;

  SmallText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
    ),);
  }
}


//Bigtext

class BigText extends StatelessWidget {
  final String text;
  final double size;

  BigText({required this.text,required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w500,
        color: AppColors.mainColor,
      ),);
  }
}
