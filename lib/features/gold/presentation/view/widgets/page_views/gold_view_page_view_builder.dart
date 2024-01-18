import 'package:black_market/features/gold/presentation/view/widgets/sections/gold_coins_section.dart';
import 'package:black_market/features/gold/presentation/view/widgets/sections/gold_ingots_section.dart';
import 'package:black_market/features/gold/presentation/view/widgets/sections/gold_section.dart';
import 'package:flutter/material.dart';

class GoldViewPageViewBuilder extends StatelessWidget {
  GoldViewPageViewBuilder({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _pages.length,
        itemBuilder: (context, index) => _pages[index],
      ),
    );
  }

  final List<Widget> _pages = <Widget>[
    const GoldSection(),
    const GoldIngotsSection(),
    const GoldCoinsSection(),
  ];
}
