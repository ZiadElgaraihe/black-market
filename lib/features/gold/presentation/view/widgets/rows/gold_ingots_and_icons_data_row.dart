import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldIngotsAndIconsDataRow extends StatelessWidget {
  const GoldIngotsAndIconsDataRow({
    super.key,
    required this.price,
    required this.title,
    this.textStyle,
  });

  final String price;
  final String title;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textStyle ??
                TextStyles.textStyle14.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                ),
          ),
          Text(
            '$price ج.م',
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
