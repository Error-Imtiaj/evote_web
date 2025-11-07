import 'package:evote_web/app/core/app_button.dart';
import 'package:evote_web/app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class NoDetails {
  static void showMyDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 64.w),
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: BoxDecoration(color: AppColor.appbarBgColor),
            child: Column(
              children: [
                Gap(48.h),
                Center(
                  child: Text(
                    text,
                    style: GoogleFonts.fjallaOne(
                      color: AppColor.bgColor,
                      decorationColor: Colors.white,
                      fontSize: 40.sp,
                    ),
                  ),
                ),
                Spacer(),
                AppButton(
                  btnText: "Check Again",
                  onTap: () {
                    return Navigator.pop(context);
                  },
                ),
                Gap(48.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
