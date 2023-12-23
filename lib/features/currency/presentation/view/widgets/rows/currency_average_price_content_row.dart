import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:black_market/features/currency/presentation/view/widgets/columns/currency_info_column.dart';
import 'package:black_market/features/currency/presentation/view/widgets/dividers/custom_vertical_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrencyAveragePriceContentRow extends StatelessWidget {
  const CurrencyAveragePriceContentRow({
    super.key,
    this.currencies,
  });

  final List<CurrencyModel>? currencies;

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
          CurrencyInfoColumn(
            title: 'شراء',
            titleColor: AppColors.black,
            value: (currencies != null)
                ? '${currencies![0].bankPrices.where((element) => element.bankId == 8).first.buyPrice} ج.م'
                : 'N/A',
            valueColor: AppColors.black,
          ),
          CustomVerticalDivider(color: AppColors.gold),
          CurrencyInfoColumn(
            title: 'بيع',
            titleColor: AppColors.black,
            value: (currencies != null)
                ? '${currencies![0].bankPrices.where((element) => element.bankId == 8).first.sellPrice} ج.م'
                : 'N/A',
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