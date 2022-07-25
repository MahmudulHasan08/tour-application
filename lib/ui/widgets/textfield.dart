import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseTextFormField extends StatelessWidget {
  final String text;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  ReuseTextFormField({required this.text, this.controller,this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        )
      ),
    );
  }
}


class ReuseTextFormFieldSuffix extends StatelessWidget {
  final String text;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  ReuseTextFormFieldSuffix({required this.text,this.suffixIcon, this.controller,this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: text,
          hintStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          )
      ),
    );
  }
}
