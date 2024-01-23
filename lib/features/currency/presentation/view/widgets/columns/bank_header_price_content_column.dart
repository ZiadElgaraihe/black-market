import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/columns/buy_and_sell_info_column.dart';
import 'package:black_market/core/presentation/view/dividers/custom_vertical_divider.dart';
import 'package:black_market/core/presentation/view_model/localization_cubit/localization_cubit.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_images.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:black_market/features/currency/data/models/currency_price_model/currency_price_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              child: CachedNetworkImage(
                imageUrl: currency.bankPrices
                    .firstWhere((element) => element.bankId == bankId)
                    .bankImage!,
                errorWidget: (context, url, error) {
                  return Padding(
                    padding: EdgeInsets.all(2.5.w),
                    child: SvgPicture.asset(
                      AppImages.assetsImagesBank,
                    ),
                  );
                },
                progressIndicatorBuilder: (context, url, progress) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 2.5.h,
                    ),
                    child: CircularProgressIndicator(
                      color: AppColors.black,
                    ),
                  );
                },
              ),
            ),
            SizedBox(width: 6.w),
            Text(
              currency.bankPrices
                  .firstWhere((element) => element.bankId == bankId)
                  .bankName!,
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
              BuyAndSellInfoColumn(
                title: Tr.of(context).bankPrice,
                titleColor: AppColors.grey,
                value:
                    '${currency.bankPrices.firstWhere((element) => element.bankId == bankId).buyPrice} ${Tr.of(context).egyptianPoundAbbreviation}',
                valueColor: AppColors.darkGrey,
              ),
              CustomVerticalDivider(color: AppColors.lightGrey),
              BuyAndSellInfoColumn(
                title: Tr.of(context).lastUpdated,
                titleColor: AppColors.grey,
                value: _getTimeSinceLastUpdate(context),
                valueColor: AppColors.darkGrey,
              ),
              CustomVerticalDivider(color: AppColors.lightGrey),
              BuyAndSellInfoColumn(
                title: Tr.of(context).blackMarket,
                titleColor: AppColors.grey,
                value:
                    '${_getLastUpdatedCurrency().buyPrice} ${Tr.of(context).egyptianPoundAbbreviation}',
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

  String _getTimeSinceLastUpdate(BuildContext context) {
    final updatedAt = DateTime.parse(currency.updatedAt);
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
