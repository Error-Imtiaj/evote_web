import 'package:evote_web/app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppToBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const AppToBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.appbarBgColor,
      title: Text(
        text,
        style: TextStyle(color: AppColor.bgColor, fontSize: 40.r),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(58.h);
}
