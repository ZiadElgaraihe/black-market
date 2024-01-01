import 'package:black_market/features/gold/presentation/view/widgets/containers/gold_view_tab_bar_container.dart';
import 'package:black_market/features/gold/presentation/view/widgets/page_views/gold_view_page_view_builder.dart';
import 'package:flutter/material.dart';

class GoldViewBody extends StatefulWidget {
  const GoldViewBody({super.key});

  @override
  State<GoldViewBody> createState() => _GoldViewBodyState();
}

class _GoldViewBodyState extends State<GoldViewBody> {
  final ValueNotifier<int> _currentSectionIndex = ValueNotifier<int>(0);
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _currentSectionIndex.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GoldViewTabBarContainer(
          currentSectionIndexValueNotifier: _currentSectionIndex,
          pageController: _pageController,
        ),
        GoldViewPageViewBuilder(pageController: _pageController),
      ],
    );
  }
}
