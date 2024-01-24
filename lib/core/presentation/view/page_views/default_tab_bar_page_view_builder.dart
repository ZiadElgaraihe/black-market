import 'package:flutter/material.dart';

class DefaultTabBarPageViewBuilder extends StatelessWidget {
  const DefaultTabBarPageViewBuilder({
    super.key,
    required PageController pageController,
    required List<Widget> pages,
  })  : _pageController = pageController,
        _pages = pages;

  final PageController _pageController;
  final List<Widget> _pages;

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
}
