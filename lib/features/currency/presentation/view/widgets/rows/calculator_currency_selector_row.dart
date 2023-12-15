import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/app_images.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalculatorCurrencySelectorRow extends StatelessWidget {
  const CalculatorCurrencySelectorRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 8.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.w),
            color: AppColors.yellow,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppIcons.assetsIconsMathSymbols,
                height: 20.h,
                width: 20.w,
              ),
              SizedBox(width: 2.w),
              Text(
                'الحاسبة',
                style: TextStyles.textStyle10.copyWith(
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 5.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.w),
            color: AppColors.white,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                AppImages.assetsImagesEgyptFlag,
                height: 9.5.h,
                width: 12.5.w,
              ),
              SizedBox(width: 4.7.w),
              Text(
                'USD',
                style: TextStyles.textStyle7.copyWith(
                  color: AppColors.black,
                ),
              ),
              SizedBox(width: 4.7.w),
              SvgPicture.asset(
                AppIcons.assetsIconsArrowDown,
                height: 11.h,
                width: 11.w,
                colorFilter: ColorFilter.mode(
                  AppColors.darkGrey,
                  BlendMode.srcATop,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 14.w),
        SvgPicture.asset(
          AppIcons.assetsIconsDollarCircle,
          height: 20.h,
          width: 20.w,
          colorFilter: ColorFilter.mode(
            AppColors.yellow,
            BlendMode.srcATop,
          ),
        ),
        SizedBox(width: 14.w),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 5.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.w),
            color: AppColors.white,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                AppImages.assetsImagesEgyptFlag,
                height: 9.5.h,
                width: 12.5.w,
              ),
              SizedBox(width: 4.7.w),
              Text(
                'EGP',
                style: TextStyles.textStyle7.copyWith(
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
