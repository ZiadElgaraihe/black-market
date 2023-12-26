import 'package:black_market/core/presentation/view/columns/buy_and_sell_info_shimmer_column.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/currency/presentation/view/widgets/containers/shimmer_container.dart';
import 'package:black_market/core/presentation/view/dividers/custom_vertical_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyBankItemShimmerColumn extends StatelessWidget {
  const CurrencyBankItemShimmerColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShimmerContainer(
              height: 35.h,
              width: 35.w,
              shape: BoxShape.circle,
            ),
            ShimmerContainer(
              height: 50.h,
              width: 50.w,
              shape: BoxShape.circle,
            ),
            ShimmerContainer(
              height: 35.h,
              width: 35.w,
              shape: BoxShape.circle,
            ),
          ],
        ),
        ShimmerContainer(width: 55.w),
        SizedBox(
          height: 48.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BuyAndSellInfoShimmerColumn(
                title: 'شراء',
                titleColor: AppColors.white,
              ),
              CustomVerticalDivider(color: AppColors.grey),
              BuyAndSellInfoShimmerColumn(
                title: 'بيع',
                titleColor: AppColors.white,
              ),
            ],
          ),
        )
      ],
    );
  }
}
