import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:todo_app/common/constants/app_assets.dart';
import 'package:todo_app/common/theme/app_colors.dart';
import 'package:todo_app/common/theme/app_style.dart';
import 'package:todo_app/common/widgets/height_spacer.dart';
import 'package:todo_app/common/widgets/reusable_text.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              HeightSpacer(kHeight * 0.1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.asset(
                  AppAssets.todoPNG,
                  width: kWidth * 0.5,
                ),
              ),
              const HeightSpacer(30),
              ReusableText(
                'Enter the otp code',
                style: appStyle(18, AppColors.kLight, FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Pinput(
                  length: 6,
                  showCursor: true,
                  onCompleted: (value) {
                    if (value.length == 6) {}
                  },
                  onSubmitted: (value) {
                    if (value.length == 6) {}
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
