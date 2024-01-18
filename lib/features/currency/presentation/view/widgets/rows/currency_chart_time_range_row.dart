import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/features/currency/presentation/view/widgets/buttons/currency_chart_time_range_selector.dart';
import 'package:flutter/material.dart';

class CurrencyChartTimeRangeRow extends StatefulWidget {
  const CurrencyChartTimeRangeRow({
    super.key,
    required this.currentTimeRangeIndex,
  });

  final ValueNotifier<int> currentTimeRangeIndex;

  @override
  State<CurrencyChartTimeRangeRow> createState() =>
      _CurrencyChartTimeRangeRowState();
}

class _CurrencyChartTimeRangeRowState extends State<CurrencyChartTimeRangeRow> {
  late List<String> _timeRanges;

  @override
  void didChangeDependencies() {
    _timeRanges = <String>[
      Tr.of(context).day,
      Tr.of(context).week,
      Tr.of(context).month,
      Tr.of(context).year,
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _timeRanges.length,
        (index) => ValueListenableBuilder(
          valueListenable: widget.currentTimeRangeIndex,
          builder: (context, currentIndex, child) =>
              CurrencyChartTimeRangeSelector(
            currentTimeRangeIndex: widget.currentTimeRangeIndex,
            index: index,
            title: _timeRanges[index],
          ),
        ),
      ),
    );
  }
}
