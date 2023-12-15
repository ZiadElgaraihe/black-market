import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_images.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/currency/presentation/view/widgets/columns/currency_info_column.dart';
import 'package:black_market/features/currency/presentation/view/widgets/dividers/custom_vertical_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankHeaderPriceContentColumn extends StatelessWidget {
  const BankHeaderPriceContentColumn({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Hero(
              tag: 'BankImage$index',
              child: CircleAvatar(
                radius: 11.w,
                child: Image.asset(
                  AppImages.assetsImagesBankMisrPng,
                ),
              ),
            ),
            SizedBox(width: 6.w),
            Text(
              'بنك مصر',
              style: TextStyles.textStyle12.copyWith(
                color: AppColors.darkGrey,
              ),
            ),
          ],
        ),
        SizedBox(height: 14.h),
        SizedBox(
          height: 45.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
