import 'package:black_market/features/navbar/presentation/view/widgets/default_nav_bar.dart';
import 'package:black_market/features/navbar/presentation/view/widgets/nav_bar_view_body.dart';
import 'package:flutter/material.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _currentIndex.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavBarViewBody(
        currentIndexValueNotifier: _currentIndex,
        pageController: _pageController,
      ),
      bottomNavigationBar: DefaultNavBar(
        currentIndexValueNotifier: _currentIndex,
        pageController: _pageController,
      ),
    );
  }
}
