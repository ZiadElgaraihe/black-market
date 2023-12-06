import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/currency/presentation/view/widgets/buttons/currency_selection_button.dart';
import 'package:black_market/features/currency/presentation/view/widgets/columns/currency_info_column.dart';
import 'package:black_market/features/currency/presentation/view/widgets/dividers/custom_vertical_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyHeaderPriceContentColumn extends StatelessWidget {
  const CurrencyHeaderPriceContentColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CurrencySelectionButton(),
        SizedBox(height: 14.h),
        SizedBox(
          height: 45.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CurrencyInfoColumn(
                title: 'سعر البنك',
                titleColor: AppColors.grey,
                value: '30.24 ج.م',
                valueColor: AppColors.darkGrey,
              ),
              CustomVerticalDivider(color: AppColors.lightGrey),
              CurrencyInfoColumn(
                title: 'آخر تحديث',
                titleColor: AppColors.grey,
                value: 'منذ 15 دقيقة',
                valueColor: AppColors.darkGrey,
              ),
              CustomVerticalDivider(color: AppColors.lightGrey),
              CurrencyInfoColumn(
                title: 'السوق السوداء',
                titleColor: AppColors.grey,
                value: '40 ج.م',
                valueColor: AppColors.gold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
