import 'package:black_market/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultLoadingButton extends StatelessWidget {
  const DefaultLoadingButton({
    super.key,
    this.backgroundColor,
    this.height,
    this.progressIndicatorColor,
    this.width,
  });

  final Color? backgroundColor;
  final double? height;
  final Color? progressIndicatorColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(
          Size(
            width ?? 327.w,
            height ?? 52.h,
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(
          backgroundColor ?? AppColors.yellow,
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.w),
          ),
        ),
      ),
      child: CircularProgressIndicator(
        color: progressIndicatorColor ?? AppColors.black,
      ),
    );
  }
}
