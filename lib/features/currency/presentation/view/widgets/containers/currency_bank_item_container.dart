import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/currency/presentation/view/widgets/columns/currency_bank_item_content_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyBankItemContainer extends StatelessWidget {
  const CurrencyBankItemContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(11.5.w),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(7.w),
        border: Border.all(
          color: AppColors.grey,
          width: 0.5.w,
        ),
      ),
      child: const CurrencyBankItemContentColumn(),
    );
  }
}
