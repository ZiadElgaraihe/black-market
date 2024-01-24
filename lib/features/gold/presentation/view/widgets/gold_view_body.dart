import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/containers/default_tab_bar_container.dart';
import 'package:black_market/core/presentation/view/page_views/default_tab_bar_page_view_builder.dart';
import 'package:black_market/features/gold/presentation/view/widgets/sections/gold_coins_section.dart';
import 'package:black_market/features/gold/presentation/view/widgets/sections/gold_ingots_section.dart';
import 'package:black_market/features/gold/presentation/view/widgets/sections/gold_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldViewBody extends StatefulWidget {
  const GoldViewBody({super.key});

  @override
  State<GoldViewBody> createState() => _GoldViewBodyState();
}

class _GoldViewBodyState extends State<GoldViewBody> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabBarContainer(
          pageController: _pageController,
          tabBarTitles: <String>[
            Tr.of(context).gold,
            Tr.of(context).ingots,
            Tr.of(context).currencies,
          ],
          width: 94.w,
        ),
        DefaultTabBarPageViewBuilder(
          pageController: _pageController,
          pages: const <Widget>[
            GoldSection(),
            GoldIngotsSection(),
            GoldCoinsSection(),
          ],
        ),
      ],
    );
  }
}
