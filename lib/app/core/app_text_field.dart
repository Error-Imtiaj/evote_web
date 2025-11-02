import 'package:evote_web/app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool? obsecureText;
  const AppTextField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.obsecureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText ?? false,
      obscuringCharacter: '◉',
      controller: textEditingController,
      keyboardType: TextInputType.number,
      style: TextStyle(color: AppColor.bgColor),
      cursorColor: AppColor.buttonColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.appbarBgColor,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: AppColor.bgColor),
        ),
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: AppColor.bgColor,
            width: 2.r,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: AppColor.bgColor,
            width: 2.r,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
