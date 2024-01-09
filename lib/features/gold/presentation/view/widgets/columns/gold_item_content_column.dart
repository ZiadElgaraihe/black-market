import 'package:black_market/core/presentation/view/buttons/share_button.dart';
import 'package:black_market/core/presentation/view/columns/buy_and_sell_info_column.dart';
import 'package:black_market/core/presentation/view/dividers/custom_vertical_divider.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_images.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/gold/data/models/gold/gold_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldItemContentColumn extends StatelessWidget {
  const GoldItemContentColumn({
    super.key,
    this.gold,
  });

  final GoldModel? gold;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            const Spacer(flex: 10),
            Container(
              height: 55.h,
              width: 55.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    AppImages.assetsImagesGoldImageJpg,
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1),
            ShareButton(
              onPressed: () {},
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 9.8.h),
          child: Text(
            (gold != null) ? 'ذهب عيار ${gold!.karat}' : 'N/A',
            style: TextStyles.textStyle12.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
        SizedBox(
          height: 48.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BuyAndSellInfoColumn(
                title: 'شراء',
                titleColor: AppColors.lightGrey,
                value: (gold != null) ? '${gold!.price.buyPrice} ج.م' : 'N/A',
                valueColor: AppColors.white,
              ),
              CustomVerticalDivider(color: AppColors.grey),
              BuyAndSellInfoColumn(
                title: 'بيع',
                titleColor: AppColors.lightGrey,
                value: (gold != null) ? '${gold!.price.sellPrice} ج.م' : 'N/A',
                valueColor: AppColors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
