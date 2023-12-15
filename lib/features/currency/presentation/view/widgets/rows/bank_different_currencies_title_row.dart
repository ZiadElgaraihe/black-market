import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankDifferentCurrenciesTitlesRow extends StatelessWidget {
  const BankDifferentCurrenciesTitlesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'العملة',
          style: TextStyles.textStyle14.copyWith(
            color: AppColors.white,
          ),
        ),
        const Spacer(),
        Text(
          'شراء',
          style: TextStyles.textStyle14.copyWith(
            color: AppColors.white,
          ),
        ),
        SizedBox(width: 53.w),
        Text(
          'بيع',
          style: TextStyles.textStyle14.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
