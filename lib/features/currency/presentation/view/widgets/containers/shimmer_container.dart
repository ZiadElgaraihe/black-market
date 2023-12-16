import 'package:black_market/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    super.key,
    this.height,
    this.width,
    this.highlightColor,
    this.baseColor,
  });

  final double? height;
  final double? width;
  final Color? highlightColor;
  final Color? baseColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: highlightColor ?? AppColors.lightGrey.withOpacity(0.3),
      baseColor: baseColor ?? AppColors.lightGrey,
      child: Container(
        height: height ?? 16.h,
        width: width ?? 50.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.w),
          color: AppColors.white,
        ),
      ),
    );
  }
}
