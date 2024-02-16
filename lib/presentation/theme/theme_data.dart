import 'package:flutter/material.dart';
import 'package:flutter_demo/core/constants/color_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemeData {
  static final ThemeData appTheme = ThemeData.dark(
    useMaterial3: false,
  ).copyWith(
    brightness: Brightness.dark,
    primaryColor: ColorConstants.primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConstants.textColor,
        foregroundColor: const Color(0xFF36394A),
        elevation: 0,
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 24.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: ColorConstants.textColor,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
      ),
      bodyLarge: TextStyle(
        color: ColorConstants.textColor,
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
      ),
    ).apply(
      fontFamily: 'Quicksand',
    ),
  );
}
