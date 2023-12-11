import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/currency/presentation/view/widgets/buttons/currency_selection_button.dart';
import 'package:black_market/features/currency/presentation/view/widgets/columns/currency_info_column.dart';
import 'package:black_market/features/currency/presentation/view/widgets/dividers/custom_vertical_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankCurrencyBuyAndSellContainer extends StatelessWidget {
  const BankCurrencyBuyAndSellContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: AppColors.yellow,
      ),
      child: Column(
        children: [
          const CurrencySelectionButton(),
          SizedBox(height: 12.5.h),
          SizedBox(
            height: 45.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CurrencyInfoColumn(
                  title: 'شراء',
                  titleColor: AppColors.black,
                  value: '30.24 ج.م',
                  valueColor: AppColors.black,
                ),
                CustomVerticalDivider(color: AppColors.gold),
                CurrencyInfoColumn(
                  title: 'شراء',
                  titleColor: AppColors.black,
                  value: '30.24 ج.م',
                  valueColor: AppColors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
