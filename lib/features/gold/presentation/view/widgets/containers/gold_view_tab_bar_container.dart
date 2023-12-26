import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldViewTabBarContainer extends StatelessWidget {
  GoldViewTabBarContainer({
    super.key,
    required this.currentSectionIndexValueNotifier,
  });

  final ValueNotifier<int> currentSectionIndexValueNotifier;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      margin: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          _tabBarTitles.length,
          (index) => GestureDetector(
            onTap: () {
              currentSectionIndexValueNotifier.value = index;
            },
            child: ValueListenableBuilder(
              valueListenable: currentSectionIndexValueNotifier,
              builder: (context, currenctSectionIndex, child) => Container(
                width: 94.w,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 13.h),
                decoration: BoxDecoration(
                  color:
                      (currenctSectionIndex == index) ? AppColors.yellow : null,
                  borderRadius: BorderRadius.circular(16.w),
                ),
                child: Text(
                  _tabBarTitles[index],
                  style: TextStyles.textStyle16.copyWith(
                    color: (currenctSectionIndex == index)
                        ? AppColors.black
                        : null,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  final List<String> _tabBarTitles = <String>[
    'الذهب',
    'السبائك',
    'العملات',
  ];
}
