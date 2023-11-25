import 'package:black_market/core/presentation/view/buttons/default_button.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultAlertDialog extends StatelessWidget {
  const ResultAlertDialog({
    super.key,
    required this.buttonTitle,
    required this.message,
    required this.onPressed,
    required this.title,
  });

  final String buttonTitle;
  final String message;
  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 50.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.w),
      ),
      title: Text(
        title,
        style: TextStyles.textStyle18.copyWith(
          color: AppColors.lightYellowActive,
        ),
        textAlign: TextAlign.center,
      ),
      titlePadding: EdgeInsets.symmetric(vertical: 15.h),
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      contentTextStyle: TextStyles.textStyle14,
      actions: [
        DefaultButton(
          onPressed: onPressed,
          title: buttonTitle,
        ),
      ],
      actionsPadding: EdgeInsets.symmetric(
        horizontal: 35.w,
        vertical: 15.h,
      ),
    );
  }
}
