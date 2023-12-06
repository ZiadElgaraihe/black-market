import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/currency/presentation/view/widgets/columns/currency_header_price_content_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyHeaderPriceContainer extends StatelessWidget {
  const CurrencyHeaderPriceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.only(
        top: 11.h,
        right: 19.w,
        bottom: 17.h,
        left: 19.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: const CurrencyHeaderPriceContentColumn(),
    );
  }
}
