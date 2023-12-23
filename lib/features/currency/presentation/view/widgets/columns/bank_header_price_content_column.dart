import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_images.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:black_market/features/currency/data/models/currency_price_model/currency_price_model.dart';
import 'package:black_market/features/currency/presentation/view/widgets/columns/currency_info_column.dart';
import 'package:black_market/features/currency/presentation/view/widgets/dividers/custom_vertical_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BankHeaderPriceContentColumn extends StatelessWidget {
  const BankHeaderPriceContentColumn({
    super.key,
    required this.bankId,
    required this.currency,
  });

  final int bankId;
  final CurrencyModel currency;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 11.w,
              backgroundColor: AppColors.white,
              child: Padding(
                padding: EdgeInsets.all(2.5.w),
                child: SvgPicture.asset(
                  AppImages.assetsImagesBank,
                ),
              ),
            ),
            SizedBox(width: 6.w),
            Text(
              'بنك مصر',
              style: TextStyles.textStyle12.copyWith(
                color: AppColors.darkGrey,
              ),
            ),
          ],
        ),
        SizedBox(height: 14.h),
        SizedBox(
          height: 45.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CurrencyInfoColumn(
                title: 'سعر البنك',
                titleColor: AppColors.grey,
                value:
                    '${currency.bankPrices.firstWhere((element) => element.bankId == bankId).buyPrice} ج.م',
                valueColor: AppColors.darkGrey,
              ),
              CustomVerticalDivider(color: AppColors.lightGrey),
              CurrencyInfoColumn(
                title: 'آخر تحديث',
                titleColor: AppColors.grey,
                value: _getTimeSinceLastUpdate(),
                valueColor: AppColors.darkGrey,
              ),
              CustomVerticalDivider(color: AppColors.lightGrey),
              CurrencyInfoColumn(
                title: 'السوق السوداء',
                titleColor: AppColors.grey,
                value: '${_getLastUpdatedCurrency().buyPrice} ج.م',
                valueColor: AppColors.gold,
              ),
            ],
          ),
        ),
      ],
    );
  }

  CurrencyPriceModel _getLastUpdatedCurrency() {
    return currency.blackMarketPrices.reduce((a, b) =>
        DateTime.parse(a.updatedAt).isAfter(DateTime.parse(b.updatedAt))
            ? b
            : a);
  }

  String _getTimeSinceLastUpdate() {
    final updatedAt = DateTime.parse(currency.updatedAt);
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
