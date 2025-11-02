import 'package:evote_web/app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.bgColor,
    textTheme: GoogleFonts.fjallaOneTextTheme(),
  );
}
