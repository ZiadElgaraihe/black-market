import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/app_images.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/currency/data/models/currency_price_model/currency_price_model.dart';
import 'package:black_market/features/currency/presentation/view/widgets/buttons/action_button.dart';
import 'package:black_market/features/currency/presentation/view/widgets/columns/currency_info_column.dart';
import 'package:black_market/features/currency/presentation/view/widgets/dividers/custom_vertical_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyBankItemContentColumn extends StatelessWidget {
  const CurrencyBankItemContentColumn({
    super.key,
    required this.index,
    this.bankPrice,
  });

  final int index;
  final CurrencyPriceModel? bankPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ActionButton(
              icon: AppIcons.assetsIconsShare,
              onPressed: () {},
            ),
            Hero(
              tag: 'BankImage$index',
              child: CircleAvatar(
                radius: 23.3.w,
                child: Image.asset(
                  AppImages.assetsImagesBankMisrPng,
                ),
              ),
            ),
            ActionButton(
              icon: AppIcons.assetsIconsHeart,
              onPressed: () {},
            ),
          ],
        ),
        Text(
          'بنك مصر',
          style: TextStyles.textStyle11.copyWith(
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 48.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CurrencyInfoColumn(
                title: 'شراء',
                titleColor: AppColors.white,
                value:
                    (bankPrice != null) ? '${bankPrice!.buyPrice} ج.م' : 'N/A',
                valueColor: AppColors.white,
              ),
              CustomVerticalDivider(color: AppColors.grey),
              CurrencyInfoColumn(
                title: 'بيع',
                titleColor: AppColors.white,
                value:
                    (bankPrice != null) ? '${bankPrice!.sellPrice} ج.م' : 'N/A',
                valueColor: AppColors.white,
              ),
            ],
          ),
        )
      ],
    );
  }
}
