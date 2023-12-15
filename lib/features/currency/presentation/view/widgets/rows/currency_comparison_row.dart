import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrencyComparisonRow extends StatelessWidget {
  const CurrencyComparisonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 101.w,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.w),
            color: AppColors.white,
          ),
          child: Text(
            '1 دولار أمريكي',
            style: TextStyles.textStyle7.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        SvgPicture.asset(
          AppIcons.assetsIconsEqual,
          height: 14.h,
          width: 14.w,
        ),
        Container(
          width: 101.w,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.w),
            color: AppColors.white,
          ),
          child: Text(
            '40.1 جنيه مصري',
            style: TextStyles.textStyle7.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
