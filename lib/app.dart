import 'package:evote_web/feature/Home/screen/ui/home_screen.dart';
import 'package:evote_web/app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Evote extends StatefulWidget {
  const Evote({super.key});

  @override
  State<Evote> createState() => _EvoteState();
}

class _EvoteState extends State<Evote> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: Size(917, 929),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: HomeScreen(),
      ),
    );
  }
}
