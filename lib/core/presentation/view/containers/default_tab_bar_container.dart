import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTabBarContainer extends StatefulWidget {
  const DefaultTabBarContainer({
    super.key,
    required this.pageController,
    required this.tabBarTitles,
    required this.width,
  });

  final PageController pageController;
  final List<String> tabBarTitles;
  final double width;

  @override
  State<DefaultTabBarContainer> createState() => _DefaultTabBarContainerState();
}

class _DefaultTabBarContainerState extends State<DefaultTabBarContainer> {
  final ValueNotifier<int> _currentSectionIndex = ValueNotifier<int>(0);

  @override
  void dispose() {
    _currentSectionIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          widget.tabBarTitles.length,
          (index) => GestureDetector(
            onTap: () {
              _currentSectionIndex.value = index;
              widget.pageController.jumpToPage(index);
            },
            child: ValueListenableBuilder(
              valueListenable: _currentSectionIndex,
              builder: (context, currenctSectionIndex, child) => Container(
                width: widget.width,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 13.h),
                decoration: BoxDecoration(
                  color:
                      (currenctSectionIndex == index) ? AppColors.yellow : null,
                  borderRadius: BorderRadius.circular(16.w),
                ),
                child: Text(
                  widget.tabBarTitles[index],
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
}
