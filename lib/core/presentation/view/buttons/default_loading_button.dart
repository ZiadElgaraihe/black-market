import 'package:black_market/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultLoadingButton extends StatelessWidget {
  const DefaultLoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
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
      child: CircularProgressIndicator(
        color: AppColors.black,
      ),
    );
  }
}
