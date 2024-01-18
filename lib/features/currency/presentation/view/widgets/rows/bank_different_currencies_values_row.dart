import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankDifferentCurrenciesValuesRow extends StatelessWidget {
  const BankDifferentCurrenciesValuesRow({
    super.key,
    required this.bankId,
    required this.currency,
  });

  final int bankId;
  final CurrencyModel currency;

  @override
  Widget build(BuildContext context) {
    return (currency.bankPrices
                .where((element) => element.bankId == bankId)
                .firstOrNull != null)
        ? Padding(
            padding: EdgeInsets.symmetric(vertical: 7.5.h),
            child: Row(
              children: [
                SizedBox(
                  width: 125.w,
                  child: Text(
                    currency.name.split('/').first,
                    style: TextStyles.textStyle13.copyWith(
                      color: AppColors.white,
                    ),
                    maxLines: 3,
                  ),
                ),
                const Spacer(flex: 1),
                Text(
                  '${currency.bankPrices.where((element) => element.bankId == bankId).first.buyPrice}',
                  style: TextStyles.textStyle12.copyWith(
                    color: AppColors.yellow,
                  ),
                ),
                const Spacer(flex: 1),
                Text(
                  '${currency.bankPrices.where((element) => element.bankId == bankId).first.sellPrice}',
                  style: TextStyles.textStyle12.copyWith(
                    color: AppColors.yellow,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
