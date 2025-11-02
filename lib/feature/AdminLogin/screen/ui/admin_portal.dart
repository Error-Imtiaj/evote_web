import 'package:evote_web/app/core/app_button.dart';
import 'package:evote_web/app/utils/app_color.dart';
import 'package:evote_web/feature/CandidateReg/screen/ui/candidate_reg.dart';
import 'package:evote_web/feature/VoterReg/screen/ui/voter_reg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AdminPortal extends StatelessWidget {
  const AdminPortal({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                "Welcome Back \nChief!",
                style: TextStyle(color: AppColor.appbarBgColor, fontSize: 56.r),
              ),
            ),
          ),
          Container(
            height: double.maxFinite,
            width: screenWidth * 0.6,
            decoration: BoxDecoration(
              color: AppColor.appbarBgColor,
              border: Border(
                left: BorderSide(color: AppColor.buttonColor, width: 4),
              ),
            ),
            child: Center(
              child: Container(
                height: screenHeight * 0.8,
                width: screenWidth * 0.3,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: AppColor.bgColor, width: 2),
                    left: BorderSide(color: AppColor.bgColor, width: 2),
                    right: BorderSide(color: AppColor.bgColor, width: 6),
                    bottom: BorderSide(color: AppColor.bgColor, width: 6),
                  ),
                ),
                child: Column(
                  children: [
                    Gap(64.r),
                    homeTitle(),
                    Gap(32.r),
                    AppButton(
                      btnText: "Voter Register",
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return VoterReg();
                          },
                        ),
                      ),
                    ),
                    Gap(16.r),
                    AppButton(
                      btnText: "Candidate Register",
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CandidateReg();
                          },
                        ),
                      ),
                    ),
                    Gap(16.r),
                    AppButton(btnText: "Candidate List"),
                    Gap(16.r),
                    AppButton(btnText: "Voter List"),
                    Gap(16.r),
                    AppButton(btnText: "Candidate Verify"),
                    Gap(16.r),
                    AppButton(btnText: "Voter Verify"),
                    Spacer(),
                    AppButton(btnText: "Logout"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget homeTitle() {
    return Text(
      "Select Your Operation",
      style: TextStyle(
        color: AppColor.bgColor,
        fontSize: 32.r,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
