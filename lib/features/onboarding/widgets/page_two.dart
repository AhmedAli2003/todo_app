import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/common/constants/app_assets.dart';
import 'package:todo_app/common/router/app_routes.dart';
import 'package:todo_app/common/theme/app_colors.dart';
import 'package:todo_app/common/theme/app_style.dart';
import 'package:todo_app/common/widgets/custom_outlined_button.dart';
import 'package:todo_app/common/widgets/height_spacer.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

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
          const HeightSpacer(50),
          CustomOutlinedButton(
            onTap: () {
              GoRouter.of(context).go(AppRoutes.login);
            },
            height: kHeight * 0.06,
            width: kWidth * 0.9,
            borderColor: AppColors.kLight,
            text: 'Login with a phone number',
          ),
        ],
      ),
    );
  }
}
