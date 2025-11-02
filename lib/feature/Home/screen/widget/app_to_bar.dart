import 'package:evote_web/app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppToBar extends StatelessWidget implements PreferredSizeWidget {
  const AppToBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.appbarBgColor,
      title: Text(
        "Welcome to Evote",
        style: TextStyle(color: AppColor.bgColor, fontSize: 40.r),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(58.h);
}
