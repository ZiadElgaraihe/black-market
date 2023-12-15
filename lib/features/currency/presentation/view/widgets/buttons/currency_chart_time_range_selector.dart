import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyChartTimeRangeSelector extends StatelessWidget {
  const CurrencyChartTimeRangeSelector({
    super.key,
    required this.currentTimeRangeIndex,
    required this.index,
    required this.title,
  });

  final ValueNotifier<int> currentTimeRangeIndex;
  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        currentTimeRangeIndex.value = index;
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        margin: EdgeInsets.symmetric(horizontal: 9.w),
        decoration: BoxDecoration(
          color: (currentTimeRangeIndex.value == index)
              ? AppColors.yellow.withOpacity(0.2)
              : AppColors.transparent,
          borderRadius: BorderRadius.circular(7.w),
        ),
        child: Text(
          title,
          style: TextStyles.textStyle12.copyWith(
            color: (currentTimeRangeIndex.value == index)
                ? AppColors.yellow
                : AppColors.white,
          ),
        ),
      ),
    );
  }
}
