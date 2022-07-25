import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:tour/business_logics/auth.dart';
import 'package:tour/ui/route/routes.dart';
import 'package:tour/ui/widgets/button.dart';
import 'package:tour/utils/const/appcolors.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  Rx<bool> _loaded = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: AppColors.buttonInActiveColor,
                  ),
                  child: SfPdfViewer.network(
                    "https://firebasestorage.googleapis.com/v0/b/tour-1a768.appspot.com/o/pdf_files%2FCV%20of%20mahmudul.pdf?alt=media&token=ac123fc4-449c-4414-bb57-6e1951cc002a",
                    onDocumentLoaded: (PdfDocumentLoadedDetails details) {
                      _loaded.value = true;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 30.w, right: 30.w),
                child: Obx(
                  () => _loaded == true
                      ? ReuseAblebutton(
                          text: "Agree",
                          onAction: () {
                            Auth().storedPrivacyInfo();
                            Get.toNamed(mainhomescreen);
                          },
                        )
                      : Text("Still Loading"),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
