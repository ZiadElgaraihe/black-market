import 'package:black_market/core/presentation/view/buttons/default_button.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_images.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessViewBody extends StatelessWidget {
  const SuccessViewBody({
    super.key,
    required this.buttonTitle,
    required this.onPressed, 
    required this.title, 
  });

  final String buttonTitle;
  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 203.h),
            SvgPicture.asset(
              AppImages.assetsImagesSuccess,
              height: 183.h,
              width: 204.9.w,
            ),
            SizedBox(height: 47.h),
            Text(
              title,
              style: TextStyles.textStyle22.copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.yellow,
              ),
            ),
            SizedBox(height: 171.h),
            DefaultButton(
              onPressed: onPressed,
              title: buttonTitle,
            ),
          ],
        ),
      ),
    );
  }
}
