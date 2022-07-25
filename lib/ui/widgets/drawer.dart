import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour/utils/const/appcolors.dart';

Widget drawer(title, onclick) {
  return InkWell(
    onTap: onclick,
    child: Text(
      title,
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w300,
        color: AppColors.blackColor,
      ),
    ),
  );
}
