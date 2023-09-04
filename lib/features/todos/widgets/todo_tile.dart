import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:todo_app/common/theme/app_colors.dart';
import 'package:todo_app/common/theme/app_style.dart';
import 'package:todo_app/common/widgets/height_spacer.dart';
import 'package:todo_app/common/widgets/reusable_text.dart';
import 'package:todo_app/common/widgets/width_spacer.dart';

class TodoTile extends StatelessWidget {
  final String? title;
  final String? description;
  final Color? barColor;
  final String? start;
  final String? end;
  final void Function()? edit;
  final Widget? switcher;
  final void Function()? delete;

  const TodoTile({
    super.key,
    this.title,
    this.barColor,
    this.description,
    this.start,
    this.end,
    this.delete,
    this.switcher,
    this.edit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8).h,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8).h,
              width: kWidth,
              decoration: BoxDecoration(
                color: AppColors.kGreyLight,
                borderRadius: BorderRadius.circular(kRadius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 80,
                        width: 5,
                        decoration: BoxDecoration(
                          color: barColor ?? AppColors.getRandomColor(),
                          borderRadius: BorderRadius.circular(kRadius),
                        ),
                      ),
                      const WidthSpacer(15),
                      Padding(
                        padding: const EdgeInsets.all(4).h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: kWidth * 0.6,
                              child: ReusableText(
                                title ?? 'Task',
                                style: appStyle(18, AppColors.kLight, FontWeight.bold),
                              ),
                            ),
                            const HeightSpacer(3),
                            SizedBox(
                              width: kWidth * 0.6,
                              child: ReusableText(
                                description ?? '',
                                style: appStyle(12, AppColors.kLight, FontWeight.w500),
                              ),
                            ),
                            const HeightSpacer(16),
                            Container(
                              alignment: Alignment.center,
                              width: kWidth * 0.4,
                              height: 32.h,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.kBkDark,
                                border: Border.all(width: 0.3, color: AppColors.kGreyDk),
                                borderRadius: BorderRadius.circular(kRadius),
                              ),
                              child: ReusableText(
                                '$start | $end',
                                style: appStyle(12, AppColors.kLight, FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (switcher != null) switcher!,
                ],
              ),
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: edit,
                    child: const Icon(Icons.edit_rounded),
                  ),
                  const WidthSpacer(20),
                  GestureDetector(
                    onTap: delete,
                    child: const Icon(MaterialCommunityIcons.delete_circle),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
