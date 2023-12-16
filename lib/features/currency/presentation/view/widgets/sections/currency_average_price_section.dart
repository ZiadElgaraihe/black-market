import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/currency/presentation/view/widgets/blocs/currency_average_price_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      child: const CurrencyAveragePriceBlocBuilder(),
    );
  }
}
