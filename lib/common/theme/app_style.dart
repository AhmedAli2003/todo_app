import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final double kWidth = 375.w;
final double kHeight = 875.h;
final double kRadius = 12.h;

TextStyle appStyle(double size, Color color, FontWeight fontWeight) {
  return GoogleFonts.poppins(
    fontSize: size.sp,
    color: color,
    fontWeight: fontWeight,
  );
}
