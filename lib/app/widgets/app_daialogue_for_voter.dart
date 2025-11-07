import 'package:evote_web/app/core/app_button.dart';
import 'package:evote_web/app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDaialogueForVoter {
  static void showMyDialog(
    BuildContext context,
    String nid,
    String voterName,
    String bDate,
    bool hasVoted,
  ) {
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
                Gap(20.h),
                // TITLE
                Text(
                  "Voter Verification",
                  style: GoogleFonts.fjallaOne(
                    color: AppColor.bgColor,
                    decorationColor: Colors.white,
                    fontSize: 40.sp,
                  ),
                ),
                // ID
                Gap(28.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Voter Nid :",
                      style: GoogleFonts.fjallaOne(
                        color: AppColor.bgColor,
                        decorationColor: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Text(
                      "$nid",
                      style: GoogleFonts.fjallaOne(
                        color: AppColor.bgColor,
                        decorationColor: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Divider(),
                // NAME
                Gap(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Voter Name :",
                      style: GoogleFonts.fjallaOne(
                        color: AppColor.bgColor,
                        decorationColor: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Text(
                      "$voterName",
                      style: GoogleFonts.fjallaOne(
                        color: AppColor.bgColor,
                        decorationColor: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Divider(),
                // CANDIDATE NAME
                Gap(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date Of Birth :",
                      style: GoogleFonts.fjallaOne(
                        color: AppColor.bgColor,
                        decorationColor: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Text(
                      "$bDate",
                      style: GoogleFonts.fjallaOne(
                        color: AppColor.bgColor,
                        decorationColor: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Divider(),
                Gap(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Has Voted :",
                      style: GoogleFonts.fjallaOne(
                        color: AppColor.bgColor,
                        decorationColor: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Text(
                      "$hasVoted",
                      style: GoogleFonts.fjallaOne(
                        color: AppColor.bgColor,
                        decorationColor: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Divider(),

                // VOTE COUNT
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
