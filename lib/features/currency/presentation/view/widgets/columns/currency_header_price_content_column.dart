import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/columns/buy_and_sell_info_column.dart';
import 'package:black_market/core/presentation/view_model/localization_cubit/localization_cubit.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:black_market/features/currency/data/models/currency_price_model/currency_price_model.dart';
import 'package:black_market/features/currency/presentation/view/widgets/buttons/currency_selection_button.dart';
import 'package:black_market/core/presentation/view/dividers/custom_vertical_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyHeaderPriceContentColumn extends StatelessWidget {
  const CurrencyHeaderPriceContentColumn({
    super.key,
    this.currencies,
    required this.currentIndexValueNotifier,
  });

  final List<CurrencyModel>? currencies;
  final ValueNotifier<int> currentIndexValueNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CurrencySelectionButton(
          currencies: currencies,
          currentIndexValueNotifier: currentIndexValueNotifier,
        ),
        SizedBox(height: 14.h),
        SizedBox(
          height: 45.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BuyAndSellInfoColumn(
                title: Tr.of(context).bankPrice,
                titleColor: AppColors.grey,
                value: (currencies != null)
                    ? '${currencies![currentIndexValueNotifier.value].bankPrices.where((element) => element.bankId == 8).first.buyPrice} ${Tr.of(context).egyptianPoundAbbreviation}'
                    : 'N/A',
                valueColor: AppColors.darkGrey,
              ),
              CustomVerticalDivider(color: AppColors.lightGrey),
              BuyAndSellInfoColumn(
                title: Tr.of(context).lastUpdated,
                titleColor: AppColors.grey,
                value: (currencies != null)
                    ? _getTimeSinceLastUpdate(context)
                    : 'N/A',
                valueColor: AppColors.darkGrey,
              ),
              CustomVerticalDivider(color: AppColors.lightGrey),
              BuyAndSellInfoColumn(
                title: Tr.of(context).blackMarket,
                titleColor: AppColors.grey,
                value: (currencies != null)
                    ? '${_getLastUpdatedCurrency().buyPrice} ${Tr.of(context).egyptianPoundAbbreviation}'
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
    return currencies![currentIndexValueNotifier.value]
        .blackMarketPrices
        .reduce((a, b) =>
            DateTime.parse(a.updatedAt).isAfter(DateTime.parse(b.updatedAt))
                ? b
                : a);
  }

  String _getTimeSinceLastUpdate(BuildContext context) {
    final updatedAt =
        DateTime.parse(currencies![currentIndexValueNotifier.value].updatedAt);
    final currentTime = DateTime.now();
    final difference = currentTime.difference(updatedAt).abs();

    if (difference.inSeconds <= 59) {
      final seconds = difference.inSeconds;
      return context.read<LocalizationCubit>().isArabic()
          ? 'منذ $seconds ثانية'
          : '$seconds seconds ago';
    } else if (difference.inMinutes <= 59) {
      final minutes = difference.inMinutes;
      return context.read<LocalizationCubit>().isArabic()
          ? 'منذ $minutes دقيقة'
          : '$minutes minutes ago';
    } else if (difference.inHours <= 23) {
      final hours = difference.inHours;
      return context.read<LocalizationCubit>().isArabic()
          ? 'منذ $hours ساعة'
          : '$hours hours ago';
    } else {
      final days = difference.inDays;
      return context.read<LocalizationCubit>().isArabic()
          ? 'منذ $days يوم'
          : '$days days ago';
    }
  }
}
