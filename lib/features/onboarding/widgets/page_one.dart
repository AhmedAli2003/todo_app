import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/common/constants/app_assets.dart';
import 'package:todo_app/common/theme/app_colors.dart';
import 'package:todo_app/common/theme/app_style.dart';
import 'package:todo_app/common/widgets/height_spacer.dart';
import 'package:todo_app/common/widgets/reusable_text.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kHeight,
      width: kWidth,
      color: AppColors.kBkDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Image.asset(AppAssets.todoPNG),
          ),
          const HeightSpacer(100),
          ReusableText(
            'Todo App with Riverpod',
            style: appStyle(26, AppColors.kLight, FontWeight.w600),
          ),
          const HeightSpacer(16),
          ReusableText(
            'Welcome!! List your todos fast and easy!',
            style: appStyle(16, AppColors.kGreyLight, FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
