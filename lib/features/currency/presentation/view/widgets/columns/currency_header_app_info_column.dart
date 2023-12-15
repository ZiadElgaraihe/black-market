import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyHeaderAppInfoColumn extends StatelessWidget {
  const CurrencyHeaderAppInfoColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Black Market',
          style: TextStyles.textStyle28.copyWith(
            color: AppColors.yellow,
          ),
        ),
        SizedBox(height: 14.h),
        Text(
          'بكام في السوق السوداء؟!',
          style: TextStyles.textStyle14.copyWith(
            color: AppColors.lightYellowActive,
          ),
        ),
      ],
    );
  }
}
