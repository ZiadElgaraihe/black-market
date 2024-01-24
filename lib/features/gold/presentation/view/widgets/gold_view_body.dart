import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/containers/default_tab_bar_container.dart';
import 'package:black_market/features/gold/presentation/view/widgets/page_views/gold_view_page_view_builder.dart';
import 'package:flutter/material.dart';

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
        ),
        GoldViewPageViewBuilder(pageController: _pageController),
      ],
    );
  }
}
