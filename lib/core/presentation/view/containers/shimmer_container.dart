import 'package:black_market/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    super.key,
    this.baseColor,
    this.height,
    this.highlightColor,
    this.raduis,
    this.shape = BoxShape.rectangle,
    this.width,
  });

  final Color? baseColor;
  final double? height;
  final Color? highlightColor;
  final double? raduis;
  final BoxShape shape;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: highlightColor ?? AppColors.lightGrey.withOpacity(0.3),
      baseColor: baseColor ?? AppColors.lightGrey,
      child: Container(
        height: height ?? 16.h,
        width: width ?? 50.w,
        decoration: BoxDecoration(
          borderRadius: (shape == BoxShape.rectangle)
              ? BorderRadius.circular(raduis ?? 15.w)
              : null,
          color: AppColors.white,
          shape: shape,
        ),
      ),
    );
  }
}
