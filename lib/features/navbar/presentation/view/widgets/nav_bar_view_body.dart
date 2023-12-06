import 'package:black_market/features/currency/presentation/view/currency_view.dart';
import 'package:flutter/material.dart';

class NavBarViewBody extends StatelessWidget {
  NavBarViewBody({
    super.key,
    required this.currentIndexValueNotifier,
    required this.pageController,
  });

  final ValueNotifier<int> currentIndexValueNotifier;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: (value) {
        currentIndexValueNotifier.value = value;
      },
      physics: const BouncingScrollPhysics(),
      itemCount: _views.length,
      itemBuilder: (context, index) => _views[index],
    );
  }

  final List<Widget> _views = <Widget>[
    const CurrencyView(),
    const SafeArea(
      child: Text('Gold'),
    ),
    const SafeArea(
      child: Text('Favourite'),
    ),
    const SafeArea(
      child: Text('Profile'),
    ),
  ];
}
