import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldIngotsAndCoinsDataRow extends StatelessWidget {
  const GoldIngotsAndCoinsDataRow({
    super.key,
    required this.title,
    this.price,
    this.textStyle,
  });

  final String title;
  final String? price;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: textStyle ??
                  TextStyles.textStyle14.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                  ),
              maxLines: 2,
            ),
          ),
          SizedBox(width: 20.w),
          Text(
            (price != null)
                ? '$price ${Tr.of(context).egyptianPoundAbbreviation}'
                : 'N/A',
            style: textStyle ??
                TextStyles.textStyle14.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ],
      ),
    );
  }
}
