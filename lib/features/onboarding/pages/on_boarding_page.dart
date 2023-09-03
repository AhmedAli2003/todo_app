import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_app/common/theme/app_colors.dart';
import 'package:todo_app/common/theme/app_style.dart';
import 'package:todo_app/common/widgets/reusable_text.dart';
import 'package:todo_app/common/widgets/width_spacer.dart';
import 'package:todo_app/features/onboarding/widgets/page_one.dart';
import 'package:todo_app/features/onboarding/widgets/page_two.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _pageController,
            children: const [
              PageOne(),
              PageTwo(),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 30.h,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.ease,
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Ionicons.chevron_forward_circle,
                          size: 30,
                          color: AppColors.kLight,
                        ),
                        const WidthSpacer(5),
                        ReusableText(
                          'Skip',
                          style: appStyle(16, AppColors.kLight, FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SmoothPageIndicator(
                    count: 2,
                    controller: _pageController,
                    effect: const WormEffect(
                      dotHeight: 12,
                      dotWidth: 16,
                      spacing: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
