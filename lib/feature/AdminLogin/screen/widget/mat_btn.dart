import 'package:evote_web/app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MatBtn extends StatelessWidget {
  const MatBtn({super.key, this.onTap, required this.text});
  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: ContinuousRectangleBorder(
        side: BorderSide(color: AppColor.bgColor, width: 1.2),
      ),
      onPressed: () {},
      child: Text(text, style: TextStyle(fontSize: 16.r)),
    );
  }
}
