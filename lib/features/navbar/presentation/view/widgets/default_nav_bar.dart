import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultNavBar extends StatefulWidget {
  const DefaultNavBar({
    super.key,
    required this.currentIndexValueNotifier,
    required this.pageController,
  });

  final ValueNotifier<int> currentIndexValueNotifier;
  final PageController pageController;

  @override
  State<DefaultNavBar> createState() => _DefaultNavBarState();
}

class _DefaultNavBarState extends State<DefaultNavBar> {
  late List<Map<String, String>> _navbarItemsData;

  @override
  void didChangeDependencies() {
    _navbarItemsData = <Map<String, String>>[
      {
        'label': Tr.of(context).currencies,
        'icon': AppIcons.assetsIconsNavbarDollar,
        'active_icon': AppIcons.assetsIconsNavbarDollarActive,
      },
      {
        'label': Tr.of(context).gold,
        'icon': AppIcons.assetsIconsNavbarGold,
        'active_icon': AppIcons.assetsIconsNavbarGoldActive,
      },
      {
        'label': Tr.of(context).favourite,
        'icon': AppIcons.assetsIconsNavbarHeart,
        'active_icon': AppIcons.assetsIconsNavbarHeartActive,
      },
      {
        'label': Tr.of(context).profile,
        'icon': AppIcons.assetsIconsNavbarProfile,
        'active_icon': AppIcons.assetsIconsNavbarProfileActive,
      },
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 94.h,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(18.w),
        ),
        child: ValueListenableBuilder(
          valueListenable: widget.currentIndexValueNotifier,
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
              widget.currentIndexValueNotifier.value = value;
              widget.pageController.jumpToPage(value);
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
}
