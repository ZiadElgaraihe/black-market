import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrencyComparisonRow extends StatelessWidget {
  const CurrencyComparisonRow({
    super.key,
    required this.controller,
    required this.currency,
    required this.valueInEgyptianPound,
  });

  final TextEditingController controller;
  final CurrencyModel currency;
  final ValueNotifier<double> valueInEgyptianPound;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueInEgyptianPound,
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 101.w,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.w),
              color: AppColors.white,
            ),
            child: Text(
              '${(controller.text.isNotEmpty) ? controller.text : '1'} ${currency.code.toUpperCase()}',
              style: TextStyles.textStyle7.copyWith(
                color: AppColors.black,
              ),
            ),
          ),
          SvgPicture.asset(
            AppIcons.assetsIconsEqual,
            height: 14.h,
            width: 14.w,
          ),
          Container(
            width: 101.w,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.w),
              color: AppColors.white,
            ),
            child: Text(
              '$value ${Tr.of(context).egyptianPoundAbbreviation}',
              style: TextStyles.textStyle7.copyWith(
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
