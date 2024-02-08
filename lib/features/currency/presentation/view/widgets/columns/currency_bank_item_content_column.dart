import 'package:black_market/core/functions/future_delayd_navigator.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/buttons/favourite_button.dart';
import 'package:black_market/core/presentation/view/buttons/share_button.dart';
import 'package:black_market/core/presentation/view/columns/buy_and_sell_info_column.dart';
import 'package:black_market/core/presentation/view/dividers/custom_vertical_divider.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_images.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/currency/data/models/currency_price_model/currency_price_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

class CurrencyBankItemContentColumn extends StatelessWidget {
  const CurrencyBankItemContentColumn({
    super.key,
    this.bankPrice,
    this.currencyName,
  });

  final CurrencyPriceModel? bankPrice;
  final String? currencyName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShareButton(
              onPressed: () {
                _shareBankPrice(context);
              },
            ),
            CircleAvatar(
              radius: 23.3.w,
              backgroundColor: AppColors.white,
              child: ClipOval(
                child: (bankPrice != null && bankPrice!.bankImage != null)
                    ? CachedNetworkImage(
                        imageUrl: bankPrice!.bankImage!,
                        errorWidget: (context, url, error) {
                          return Padding(
                            padding: EdgeInsets.all(7.5.w),
                            child: SvgPicture.asset(
                              AppImages.assetsImagesBank,
                            ),
                          );
                        },
                        progressIndicatorBuilder: (context, url, progress) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 13.5.w,
                              vertical: 10.h,
                            ),
                            child: CircularProgressIndicator(
                              color: AppColors.black,
                            ),
                          );
                        },
                      )
                    : Padding(
                        padding: EdgeInsets.all(7.5.w),
                        child: SvgPicture.asset(
                          AppImages.assetsImagesBank,
                        ),
                      ),
              ),
            ),
            FavouriteButton(
              bankPrice: bankPrice,
            ),
          ],
        ),
        Text(
          (bankPrice != null)
              ? '${bankPrice!.bankName}'
              : Tr.of(context).unknown,
          style: TextStyles.textStyle11.copyWith(
            color: AppColors.white,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 48.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BuyAndSellInfoColumn(
                title: Tr.of(context).buy,
                titleColor: AppColors.white,
                value: (bankPrice != null)
                    ? '${bankPrice!.buyPrice} ${Tr.of(context).egyptianPoundAbbreviation}'
                    : Tr.of(context).unknown,
                valueColor: AppColors.white,
              ),
              CustomVerticalDivider(color: AppColors.grey),
              BuyAndSellInfoColumn(
                title: Tr.of(context).sell,
                titleColor: AppColors.white,
                value: (bankPrice != null)
                    ? '${bankPrice!.sellPrice} ${Tr.of(context).egyptianPoundAbbreviation}'
                    : Tr.of(context).unknown,
                valueColor: AppColors.white,
              ),
            ],
          ),
        )
      ],
    );
  }

  void _shareBankPrice(BuildContext context) {
    if (bankPrice != null && currencyName != null) {
      futureDelayedNavigator(() {
        Share.share(
          'تطبيق بكام في السوق السوداء؟!\n$currencyName price in ${bankPrice!.bankName}\n${Tr.of(context).buy} : ${bankPrice!.buyPrice} - ${Tr.of(context).sell} : ${bankPrice!.sellPrice}',
          subject: 'أسعار العملات',
        );
      });
    }
  }
}
