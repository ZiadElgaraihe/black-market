import 'package:black_market/features/gold/presentation/view/widgets/containers/gold_view_tab_bar_container.dart';
import 'package:black_market/features/gold/presentation/view/widgets/sections/gold_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldViewBody extends StatefulWidget {
  const GoldViewBody({super.key});

  @override
  State<GoldViewBody> createState() => _GoldViewBodyState();
}

class _GoldViewBodyState extends State<GoldViewBody> {
  final ValueNotifier<int> _currentSectionIndex = ValueNotifier<int>(0);

  @override
  void dispose() {
    _currentSectionIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          GoldViewTabBarContainer(
            currentSectionIndexValueNotifier: _currentSectionIndex,
          ),
          const GoldSection(),
        ],
      ),
    );
  }
}
