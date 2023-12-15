import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultNavBar extends StatelessWidget {
  DefaultNavBar({
    super.key,
    required this.currentIndexValueNotifier,
    required this.pageController,
  });

  final ValueNotifier<int> currentIndexValueNotifier;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 94.h,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(18.w),
        ),
        child: ValueListenableBuilder(
          valueListenable: currentIndexValueNotifier,
          builder: (context, currentIndex, child) => BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyles.textStyle12,
            unselectedLabelStyle: TextStyles.textStyle12,
            selectedItemColor: AppColors.yellow,
            unselectedItemColor: AppColors.white.withOpacity(0.5),
            onTap: (value) {
              currentIndexValueNotifier.value = value;
              pageController.animateToPage(
                value,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
              );
            },
            items: List.generate(
              _navbarItemsData.length,
              (index) => BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _navbarItemsData[index]['icon']!,
                  height: 30.h,
                  width: 30.w,
                ),
                activeIcon: SvgPicture.asset(
                  _navbarItemsData[index]['active_icon']!,
                  height: 30.h,
                  width: 30.w,
                ),
                label: _navbarItemsData[index]['label']!,
              ),
            ),
          ),
        ),
      ),
    );
  }

  final List<Map<String, String>> _navbarItemsData = <Map<String, String>>[
    {
      'label': 'العملات',
      'icon': AppIcons.assetsIconsNavbarDollar,
      'active_icon': AppIcons.assetsIconsNavbarDollarActive,
    },
    {
      'label': 'الذهب',
      'icon': AppIcons.assetsIconsNavbarGold,
      'active_icon': AppIcons.assetsIconsNavbarGoldActive,
    },
    {
      'label': 'المفضلة',
      'icon': AppIcons.assetsIconsNavbarHeart,
      'active_icon': AppIcons.assetsIconsNavbarHeartActive,
    },
    {
      'label': 'البروفيل',
      'icon': AppIcons.assetsIconsNavbarProfile,
      'active_icon': AppIcons.assetsIconsNavbarProfileActive,
    },
  ];
}
