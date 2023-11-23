import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(
          Size(327.w, 52.h),
        ),
        backgroundColor: MaterialStatePropertyAll(AppColors.yellow),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.w),
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyles.textStyle16.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
