import 'package:black_market/features/currency/presentation/view/widgets/buttons/currency_chart_time_range_selector.dart';
import 'package:flutter/material.dart';

class CurrencyChartTimeRangeRow extends StatelessWidget {
  CurrencyChartTimeRangeRow({
    super.key,
    required this.currentTimeRangeIndex,
  });

  final ValueNotifier<int> currentTimeRangeIndex;

  final List<String> _timeRanges = <String>[
    'يوم',
    'إسبوع',
    'شهر',
    'سنة',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _timeRanges.length,
        (index) => ValueListenableBuilder(
          valueListenable: currentTimeRangeIndex,
          builder: (context, currentIndex, child) =>
              CurrencyChartTimeRangeSelector(
            currentTimeRangeIndex: currentTimeRangeIndex,
            index: index,
            title: _timeRanges[index],
          ),
        ),
      ),
    );
  }
}
