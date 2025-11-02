import 'package:evote_web/app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String btnText;
  final Function()? onTap;
  const AppButton({super.key, required this.btnText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52.r,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.appbarBgColor,
          border: Border.all(
            width: 2.r,
            style: BorderStyle.solid,
            color: AppColor.bgColor,
          ),
        ),
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(fontSize: 16.r, color: AppColor.bgColor),
          ),
        ),
      ),
    );
  }
}
