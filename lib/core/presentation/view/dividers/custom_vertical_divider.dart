import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      thickness: 1.w,
      color: color,
      indent: 5.h,
      endIndent: 5.h,
    );
  }
}
