import 'package:flutter/material.dart';
import 'package:todo_app/common/theme/app_style.dart';
import 'package:todo_app/common/widgets/reusable_text.dart';

class CustomOutlinedButton extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Color borderColor;
  final String text;
  final void Function()? onTap;
  const CustomOutlinedButton({
    super.key,
    required this.height,
    required this.width,
    this.color = Colors.transparent,
    this.borderColor = Colors.transparent,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kRadius),
          border: Border.all(width: 1, color: borderColor),
        ),
        child: ReusableText(
          text,
          style: appStyle(18, borderColor, FontWeight.bold),
        ),
      ),
    );
  }
}
