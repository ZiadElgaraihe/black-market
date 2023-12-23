import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/currency/presentation/view/widgets/columns/currency_info_shimmer_column.dart';
import 'package:black_market/features/currency/presentation/view/widgets/containers/shimmer_container.dart';
import 'package:black_market/features/currency/presentation/view/widgets/dividers/custom_vertical_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyHeaderPriceShimmerColumn extends StatelessWidget {
  const CurrencyHeaderPriceShimmerColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ShimmerContainer(width: 125.w),
        SizedBox(height: 14.h),
        SizedBox(
          height: 45.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CurrencyInfoShimmerColumn(
                title: 'سعر البنك',
                titleColor: AppColors.grey,
              ),
              CustomVerticalDivider(color: AppColors.lightGrey),
              CurrencyInfoShimmerColumn(
                title: 'آخر تحديث',
                titleColor: AppColors.grey,
              ),
              CustomVerticalDivider(color: AppColors.lightGrey),
              CurrencyInfoShimmerColumn(
                title: 'السوق السوداء',
                titleColor: AppColors.grey,
              ),
            ],
          ),
        ),
      ],
    );
  }
}