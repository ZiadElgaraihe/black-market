import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SnackBar messageSnackBar({required String message}) {
    return SnackBar(
      backgroundColor: AppColors.lightYellowActive,
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.w),
      ),
      duration: const Duration(seconds: 3),
      content: Text(
        message,
        style: TextStyles.textStyle14,
        textAlign: TextAlign.center,
      ),
    );
  }