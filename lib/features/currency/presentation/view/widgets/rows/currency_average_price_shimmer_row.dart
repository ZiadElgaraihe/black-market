import 'package:black_market/core/presentation/view/columns/buy_and_sell_info_shimmer_column.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/core/presentation/view/dividers/custom_vertical_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrencyAveragePriceShimmerRow extends StatelessWidget {
  const CurrencyAveragePriceShimmerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          BuyAndSellInfoShimmerColumn(
            title: 'شراء',
            titleColor: AppColors.black,
            baseColor: AppColors.gold,
            highlightColor: AppColors.gold.withOpacity(0.5),
          ),
          CustomVerticalDivider(color: AppColors.gold),
          BuyAndSellInfoShimmerColumn(
            title: 'بيع',
            titleColor: AppColors.black,
            baseColor: AppColors.gold,
            highlightColor: AppColors.gold.withOpacity(0.5),
          ),
          SvgPicture.asset(
            AppIcons.assetsIconsMathSymbols,
            height: 34.h,
            width: 34.w,
          ),
        ],
      ),
    );
  }
}
