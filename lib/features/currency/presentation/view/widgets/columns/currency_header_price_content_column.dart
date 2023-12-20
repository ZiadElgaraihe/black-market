import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:black_market/features/currency/data/models/currency_price_model/currency_price_model.dart';
import 'package:black_market/features/currency/presentation/view/widgets/buttons/currency_selection_button.dart';
import 'package:black_market/features/currency/presentation/view/widgets/columns/currency_info_column.dart';
import 'package:black_market/features/currency/presentation/view/widgets/dividers/custom_vertical_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyHeaderPriceContentColumn extends StatelessWidget {
  const CurrencyHeaderPriceContentColumn({
    super.key,
    this.currencies,
  });

  final List<CurrencyModel>? currencies;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CurrencySelectionButton(currencies: currencies),
        SizedBox(height: 14.h),
        SizedBox(
          height: 45.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CurrencyInfoColumn(
                title: 'سعر البنك',
                titleColor: AppColors.grey,
                value: (currencies != null)
                    ? '${currencies![0].bankPrices.where((element) => element.bankId == 8).first.buyPrice} ج.م'
                    : 'N/A',
                valueColor: AppColors.darkGrey,
              ),
              CustomVerticalDivider(color: AppColors.lightGrey),
              CurrencyInfoColumn(
                title: 'آخر تحديث',
                titleColor: AppColors.grey,
                value: (currencies != null) ? _getTimeSinceLastUpdate() : 'N/A',
                valueColor: AppColors.darkGrey,
              ),
              CustomVerticalDivider(color: AppColors.lightGrey),
              CurrencyInfoColumn(
                title: 'السوق السوداء',
                titleColor: AppColors.grey,
                value: (currencies != null)
                    ? '${_getLastUpdatedCurrency().buyPrice} ج.م'
                    : 'N/A',
                valueColor: AppColors.gold,
              ),
            ],
          ),
        ),
      ],
    );
  }

  CurrencyPriceModel _getLastUpdatedCurrency() {
    return currencies![0].blackMarketPrices.reduce((a, b) =>
        DateTime.parse(a.updatedAt).isAfter(DateTime.parse(b.updatedAt))
            ? b
            : a);
  }

  String _getTimeSinceLastUpdate() {
    final updatedAt = DateTime.parse(currencies![0].updatedAt);
    final currentTime = DateTime.now();
    final difference = currentTime.difference(updatedAt);

    if (difference.inMinutes <= 59) {
      return 'منذ ${difference.inMinutes} دقيقة';
    } else if (difference.inHours <= 23) {
      final hours = difference.inHours;
      return 'منذ $hours ساعة';
    } else {
      final days = difference.inDays;
      return 'منذ $days يوم';
    }
  }
}
