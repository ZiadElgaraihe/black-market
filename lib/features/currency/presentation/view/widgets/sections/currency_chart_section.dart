import 'package:black_market/features/currency/presentation/view/widgets/charts/currency_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyChartSection extends StatefulWidget {
  const CurrencyChartSection({super.key});

  @override
  State<CurrencyChartSection> createState() => _CurrencyChartSectionState();
}

class _CurrencyChartSectionState extends State<CurrencyChartSection> {
  final ValueNotifier<int> _currentTimeRangeIndex = ValueNotifier<int>(0);

  @override
  void dispose() {
    _currentTimeRangeIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: const CurrencyChart(),
    );
  }
}
