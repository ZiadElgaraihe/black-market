import 'package:black_market/features/currency/presentation/view/widgets/charts/currency_chart.dart';
import 'package:black_market/features/currency/presentation/view/widgets/rows/currency_chart_time_range_row.dart';
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
    return Column(
      children: [
        SizedBox(height: 10.h),
        const CurrencyChart(),
        // SizedBox(height: 16.h),
        // CurrencyChartTimeRangeRow(
        //   currentTimeRangeIndex: _currentTimeRangeIndex,
        // ),
      ],
    );
  }
}
