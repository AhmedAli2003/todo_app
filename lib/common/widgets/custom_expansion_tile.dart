import 'package:flutter/material.dart';
import 'package:todo_app/common/theme/app_colors.dart';
import 'package:todo_app/common/theme/app_style.dart';
import 'package:todo_app/common/widgets/bottom_title.dart';

class CustomExpansionTile extends StatelessWidget {
  final String text;
  final String text2;
  final Color? barColor;
  final List<Widget> children;
  final Widget? trailing;
  final void Function(bool)? onExpansionChanged;

  const CustomExpansionTile({
    super.key,
    required this.text,
    required this.text2,
    this.barColor,
    required this.children,
    this.trailing,
    this.onExpansionChanged,
  });

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
        child: ExpansionTile(
          iconColor: AppColors.kLight,
          collapsedIconColor: AppColors.kBkDark,
          tilePadding: EdgeInsets.zero,
          title: BottomTitle(
            text: text,
            text2: text2,
            barColor: barColor,
          ),
          childrenPadding: EdgeInsets.zero,
          onExpansionChanged: onExpansionChanged,
          controlAffinity: ListTileControlAffinity.trailing,
          trailing: trailing,
          children: children,
        ),
      ),
    );
  }
}
