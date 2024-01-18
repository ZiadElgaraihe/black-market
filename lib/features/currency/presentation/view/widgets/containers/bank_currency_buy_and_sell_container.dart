import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/columns/buy_and_sell_info_column.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:black_market/core/presentation/view/dividers/custom_vertical_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankCurrencyBuyAndSellContainer extends StatelessWidget {
  const BankCurrencyBuyAndSellContainer({
    super.key,
    required this.bankId,
    required this.currency,
  });

  final int bankId;
  final CurrencyModel currency;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: AppColors.yellow,
      ),
      child: Column(
        children: [
          Text(
            currency.name,
            style: TextStyles.textStyle10.copyWith(
              color: AppColors.darkGrey,
            ),
          ),
          SizedBox(height: 12.5.h),
          SizedBox(
            height: 45.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuyAndSellInfoColumn(
                  title: Tr.of(context).buy,
                  titleColor: AppColors.black,
                  value:
                      '${currency.bankPrices.firstWhere((element) => element.bankId == bankId).buyPrice} ${Tr.of(context).egyptianPoundAbbreviation}',
                  valueColor: AppColors.black,
                ),
                CustomVerticalDivider(color: AppColors.gold),
                BuyAndSellInfoColumn(
                  title: Tr.of(context).sell,
                  titleColor: AppColors.black,
                  value:
                      '${currency.bankPrices.firstWhere((element) => element.bankId == bankId).sellPrice} ${Tr.of(context).egyptianPoundAbbreviation}',
                  valueColor: AppColors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
