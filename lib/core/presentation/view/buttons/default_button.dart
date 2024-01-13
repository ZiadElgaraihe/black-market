import 'package:black_market/core/functions/future_delayd_navigator.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.backgroundColor,
    this.height,
    this.textColor,
    this.width,
  });

  final Color? backgroundColor;
  final double? height;
  final void Function()? onPressed;
  final Color? textColor;
  final String title;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (onPressed != null)
          ? () {
              futureDelayedNavigator(() {
                onPressed!();
              });
            }
          : null,
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(
          Size(width ?? 327.w, height ?? 52.h),
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
      child: Text(
        title,
        style: TextStyles.textStyle16.copyWith(
          color: textColor ?? AppColors.black,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
