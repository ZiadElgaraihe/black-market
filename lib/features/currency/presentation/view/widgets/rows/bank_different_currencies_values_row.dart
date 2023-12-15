import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_images.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BankDifferentCurrenciesValuesRow extends StatelessWidget {
  const BankDifferentCurrenciesValuesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.5.h),
      child: Row(
        children: [
          SvgPicture.asset(
            AppImages.assetsImagesEgyptFlag,
            height: 16.h,
            width: 16.w,
          ),
          SizedBox(width: 6.w),
          Text(
            'دولار أمريكي / USD',
            style: TextStyles.textStyle13.copyWith(
              color: AppColors.white,
            ),
          ),
          const Spacer(),
          Text(
            '30.24',
            style: TextStyles.textStyle12.copyWith(
              color: AppColors.yellow,
            ),
          ),
          SizedBox(width: 53.w),
          Text(
            '30.24',
            style: TextStyles.textStyle12.copyWith(
              color: AppColors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
