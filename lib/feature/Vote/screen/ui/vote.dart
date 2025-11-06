import 'package:evote_web/app/core/app_button.dart';
import 'package:evote_web/app/utils/app_color.dart';
import 'package:evote_web/feature/Home/screen/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class Vote extends StatelessWidget {
  const Vote({super.key});

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
                "Time to change \nthe world",
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
                    Spacer(),
                    AppButton(
                      btnText: "Vote",
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ),
                        );
                      },
                    ),
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
      "Select Your Candidate",
      style: TextStyle(
        color: AppColor.bgColor,
        fontSize: 32.r,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
