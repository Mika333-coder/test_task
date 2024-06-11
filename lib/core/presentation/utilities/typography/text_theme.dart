import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AppTextTheme on TextTheme {
  TextStyle get defaultBlack => TextStyle(
        fontSize: 16.sp,
        color: const Color(0xFF17171A),
        fontWeight: FontWeight.w900,
      );

  TextStyle get defaultBlackItalic => TextStyle(
        fontSize: 16.sp,
        color: const Color(0xFF17171A),
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.italic,
      );

  TextStyle get defaultExtraBold => TextStyle(
        fontSize: 16.sp,
        color: const Color(0xFF17171A),
        fontWeight: FontWeight.w800,
      );

  TextStyle get defaultExtraBoldItalic => TextStyle(
        fontSize: 16.sp,
        color: const Color(0xFF17171A),
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.italic,
      );

  TextStyle get defaultBold => TextStyle(
        fontSize: 19.sp,
        color: const Color(0xFF17171A),
        fontWeight: FontWeight.w700,
      );

  TextStyle get defaultBoldItalic => TextStyle(
        fontSize: 19.sp,
        color: const Color(0xFF17171A),
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.italic,
      );

  TextStyle get defaultSemiBold => TextStyle(
        fontSize: 19.sp,
        color: const Color(0xFF17171A),
        fontWeight: FontWeight.w600,
      );

  TextStyle get defaultSemiBoldItalic => TextStyle(
        fontSize: 19.sp,
        color: const Color(0xFF17171A),
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
      );

  TextStyle get defaultMedium => TextStyle(
        fontSize: 16.sp,
        color: const Color(0xFF17171A),
        fontWeight: FontWeight.w500,
      );

  TextStyle get defaultMediumItalic => TextStyle(
        fontSize: 16.sp,
        color: const Color(0xFF17171A),
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
      );

  TextStyle get defaultRegular => TextStyle(
        fontSize: 18.sp,
        color: const Color(0xFF17171A),
        fontWeight: FontWeight.w400,
      );

  TextStyle get defaultRegularItalic => TextStyle(
        fontSize: 18.sp,
        color: const Color(0xFF17171A),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      );

  TextStyle get defaultLight => TextStyle(
        fontSize: 18.sp,
        color: const Color(0xFF17171A),
        fontWeight: FontWeight.w300,
      );

  TextStyle get defaultLightItalic => TextStyle(
        fontSize: 18.sp,
        color: const Color(0xFF17171A),
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.italic,
      );

  TextStyle get defaultExtraLight => TextStyle(
        fontSize: 18.sp,
        color: const Color(0xFF17171A),
        fontWeight: FontWeight.w200,
      );

  TextStyle get defaultExtraLightItalic => TextStyle(
        fontSize: 18.sp,
        color: const Color(0xFF17171A),
        fontWeight: FontWeight.w200,
        fontStyle: FontStyle.italic,
      );

  TextStyle get defaultUltraLight => TextStyle(
        fontSize: 18.sp,
        color: const Color(0xFF17171A),
        fontWeight: FontWeight.w100,
      );

  TextStyle get defaultUltraLightItalic => TextStyle(
        fontSize: 18.sp,
        color: const Color(0xFF17171A),
        fontWeight: FontWeight.w100,
        fontStyle: FontStyle.italic,
      );

  TextStyle get titleStyle => defaultSemiBold.copyWith(
    fontSize: 17.sp
  );

  TextStyle get bodyStyle => defaultRegular.copyWith(
        fontSize: 16.sp,
      );
}
