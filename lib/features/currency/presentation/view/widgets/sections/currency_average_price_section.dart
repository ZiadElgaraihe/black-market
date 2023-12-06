import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/currency/presentation/view/widgets/columns/currency_info_column.dart';
import 'package:black_market/features/currency/presentation/view/widgets/dividers/custom_vertical_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrencyAveragePriceSection extends StatelessWidget {
  const CurrencyAveragePriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: AppColors.yellow,
      ),
      child: SizedBox(
        height: 48.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'متوسط السعر',
              style: TextStyles.textStyle10.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
            CustomVerticalDivider(color: AppColors.gold),
            CurrencyInfoColumn(
              title: 'شراء',
              titleColor: AppColors.black,
              value: '30.24 ج.م',
              valueColor: AppColors.black,
            ),
            CustomVerticalDivider(color: AppColors.gold),
            CurrencyInfoColumn(
              title: 'بيع',
              titleColor: AppColors.black,
              value: '31.25 ج.م',
              valueColor: AppColors.black,
            ),
            Material(
              color: AppColors.transparent,
              child: TextButton(
                onPressed: () {},
                child: SvgPicture.asset(
                  AppIcons.assetsIconsMathSymbols,
                  height: 34.h,
                  width: 34.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
