import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateDivider extends StatelessWidget {
  const DateDivider({
    super.key,
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1.5.h,
              endIndent: 23.99.w,
            ),
          ),
          Text(
            date,
            style: TextStyles.textStyle12.copyWith(
              color: AppColors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 1.5.h,
              indent: 23.99.w,
            ),
          ),
        ],
      ),
    );
  }
}
