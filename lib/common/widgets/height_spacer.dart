import 'package:flutter/material.dart';

class HeightSpacer extends StatelessWidget {
  final double height;
  const HeightSpacer(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
