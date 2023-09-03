import 'package:flutter/material.dart';
import 'package:todo_app/common/theme/app_colors.dart';
import 'package:todo_app/common/theme/app_style.dart';
import 'package:todo_app/common/widgets/bottom_title.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kGreyLight,
        borderRadius: BorderRadius.circular(kRadius),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: const ExpansionTile(
          title: BottomTitle(text: 'Hello', text2: 'Hello World!'),
        ),
      ),
    );
  }
}
