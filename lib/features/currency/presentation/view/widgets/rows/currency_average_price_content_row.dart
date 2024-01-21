import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/columns/buy_and_sell_info_column.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:black_market/core/presentation/view/dividers/custom_vertical_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrencyAveragePriceContentRow extends StatelessWidget {
  const CurrencyAveragePriceContentRow({
    super.key,
    this.currencies,
    required this.currentIndex,
  });

  final List<CurrencyModel>? currencies;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Tr.of(context).averagePrice,
            style: TextStyles.textStyle10.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
          CustomVerticalDivider(color: AppColors.gold),
          BuyAndSellInfoColumn(
            title: Tr.of(context).buy,
            titleColor: AppColors.black,
            value: (currencies != null)
                ? '${currencies![currentIndex].bankPrices.where((element) => element.bankId == 8).first.buyPrice} ${Tr.of(context).egyptianPoundAbbreviation}'
                : Tr.of(context).unknown,
            valueColor: AppColors.black,
          ),
          CustomVerticalDivider(color: AppColors.gold),
          BuyAndSellInfoColumn(
            title: Tr.of(context).sell,
            titleColor: AppColors.black,
            value: (currencies != null)
                ? '${currencies![currentIndex].bankPrices.where((element) => element.bankId == 8).first.sellPrice} ${Tr.of(context).egyptianPoundAbbreviation}'
                : Tr.of(context).unknown,
            valueColor: AppColors.black,
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
