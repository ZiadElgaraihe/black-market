import 'package:black_market/core/localization/generated/l10n.dart';
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
          Tr.of(context).currency,
          style: TextStyles.textStyle14.copyWith(
            color: AppColors.white,
          ),
        ),
        const Spacer(),
        Text(
          Tr.of(context).buy,
          style: TextStyles.textStyle14.copyWith(
            color: AppColors.white,
          ),
        ),
        SizedBox(width: 53.w),
        Text(
          Tr.of(context).sell,
          style: TextStyles.textStyle14.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
