import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tour/utils/const/appcolors.dart';

class ReuseAblebutton extends StatelessWidget {
  final String text;
  final Function onAction;
   ReuseAblebutton({Key? key, required this.text,required this.onAction}) : super(key: key);
   Rx<bool> _values = false.obs;
  final box = GetStorage();
  var userID;
  circleavatar(){
    var userID = box.read("uid");
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
        onTap: (){
          onAction();
          _values.value=true;
        },
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: AppColors.mainColor,
          ),
          child: _values==false?Center(
            child: Text(text,style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
              color:AppColors.whiteColor,
            ),),
          ):Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text,style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color:AppColors.whiteColor,
              ),),
              SizedBox(width: 10,),
              Transform.scale(
                scale: 0.4,
                  child: CircularProgressIndicator(color: AppColors.whiteColor,)),
            ],
          ),
        )
    ),);
  }
}
