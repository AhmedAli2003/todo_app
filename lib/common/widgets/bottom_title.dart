import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/common/theme/app_colors.dart';
import 'package:todo_app/common/theme/app_style.dart';
import 'package:todo_app/common/widgets/height_spacer.dart';
import 'package:todo_app/common/widgets/reusable_text.dart';
import 'package:todo_app/common/widgets/width_spacer.dart';

class BottomTitle extends StatelessWidget {
  final String text;
  final String text2;
  final Color? barColor;

  const BottomTitle({
    super.key,
    required this.text,
    required this.text2,
    this.barColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kWidth,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(
              builder: (context, ref, child) => child!,
              child: Container(
                height: 80,
                width: 5,
                decoration: BoxDecoration(
                  color: barColor ?? AppColors.getRandomColor(),
                  borderRadius: BorderRadius.circular(kRadius),
                ),
              ),
            ),
            const WidthSpacer(16),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    text,
                    style: appStyle(24, AppColors.kLight, FontWeight.bold),
                  ),
                  const HeightSpacer(10),
                  LimitedBox(
                    maxWidth: kWidth * 0.65,
                    child: ReusableText(
                      text2,
                      style: appStyle(12, AppColors.kLight, FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
