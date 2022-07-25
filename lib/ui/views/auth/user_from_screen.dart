import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tour/business_logics/form.dart';
import 'package:tour/ui/widgets/button.dart';
import 'package:tour/ui/widgets/text.dart';
import 'package:tour/ui/widgets/textfield.dart';
import 'package:tour/utils/const/appcolors.dart';

import '../../route/routes.dart';

class UserFormScreen extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  Rx<TextEditingController> _dobController = TextEditingController().obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  _selectedDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(1990),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      _dobController.value.text =
          "${selected.day}-${selected.month}-${selected.year}";
    }
  }

  String gender = "Male";
  String? dob;
  final fromkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldkey=GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 50.h, left: 25.w, right: 25.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: "Tell Us More About You.", size: 32.sp),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  margin: EdgeInsets.only(right: 55.w),
                  child: SmallText(
                    text:
                        "We will not share your information outside this application.",
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Form(
                  key: fromkey,
                  child: Column(
                    children: [
                      ReuseTextFormField(
                        validator: (value) {
                          if(value!.isEmpty ||  RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$").hasMatch(value) ){
                            return "Enter Correct Name";
                          }else{
                            return null;
                          }
                        },
                        text: "Full Name",
                        controller: _nameController,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ReuseTextFormField(
                        text: "Phone Number",
                        controller: _phoneController,
                        validator: (value){
                          if(value!.isEmpty || RegExp(r"^\+?0[0-9]{11}$").hasMatch(value)){
                            return "Enter valid Number";
                          }
                        },
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ReuseTextFormField(
                        text: "Address",
                        controller: _addressController,
                        validator: (value){
                          if(value!.isEmpty){
                            return "Enter Valid Address";
                          }else{
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Obx(
                        () => ReuseTextFormFieldSuffix(
                          text: "Date of Birth",
                          controller: _dobController.value,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter Date of Birth";
                            }else{
                              return null;
                            }
                          },
                          suffixIcon: IconButton(
                            onPressed: () => _selectedDate(context),
                            icon: Icon(Icons.date_range_outlined),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      ToggleSwitch(
                        activeBgColor: [
                          AppColors.buttonActiveColor,
                        ],
                        inactiveBgColor: AppColors.buttonInActiveColor,
                        initialLabelIndex: 0,
                        totalSwitches: 2,
                        labels: [
                          'Male',
                          'Female',
                        ],
                        onToggle: (index) {
                          if (index == 0) {
                            gender = "Male";
                          }
                          if (index == 1) {
                            gender = "Female";
                          }
                          print('switched to: $index');
                        },
                      ),
                      SizedBox(
                        height: 120.h,
                      ),
                      ReuseAblebutton(
                        text: "Submit",
                        onAction: () {
                          if(fromkey.currentState!.validate()){
                            UserInfo().sendFormDatatoDB(
                                _nameController.text,
                                int.parse(_phoneController.text),
                                _addressController.text,
                                _dobController.value.text,
                                gender);
                          }


                        },
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
