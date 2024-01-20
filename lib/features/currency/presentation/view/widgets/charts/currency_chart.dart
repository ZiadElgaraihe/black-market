import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view_model/localization_cubit/localization_cubit.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/currency/data/models/filter_price_model/filter_price_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CurrencyChart extends StatelessWidget {
  const CurrencyChart({
    super.key,
    this.livePrices,
  });

  final List<FilterPriceModel>? livePrices;

  double findMinY() {
    if (livePrices == null || livePrices!.length != 8) {
      return 0.0; // Default value when the list is empty
    }

    return livePrices!
            .map((price) => price.price)
            .reduce((a, b) => a < b ? a : b) -
        5;
  }

  double findMaxY() {
    if (livePrices == null || livePrices!.length != 8) {
      return 5.0; // Default value when the list is empty
    }

    return livePrices!
            .map((price) => price.price)
            .reduce((a, b) => a > b ? a : b) +
        5;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 268.h,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 8,
          minY: findMinY(),
          maxY: findMaxY(),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32.h,
                getTitlesWidget: (value, meta) {
                  Map<int, String> values = {};

                  if (livePrices != null && livePrices!.length == 8) {
                    for (int i = 1; i <= 7; i++) {
                      values[i] = DateFormat(
                        'EE',
                        context
                            .read<LocalizationCubit>()
                            .appLocale
                            .languageCode,
                      ).format(DateTime.parse(livePrices![i].date));
                    }
                  } else {
                    values = {
                      1: Tr.of(context).saturday,
                      2: Tr.of(context).sunday,
                      3: Tr.of(context).monday,
                      4: Tr.of(context).tuesday,
                      5: Tr.of(context).wednesday,
                      6: Tr.of(context).thursday,
                      7: Tr.of(context).friday,
                    };
                  }

                  return SideTitleWidget(
                    axisSide: AxisSide.top,
                    child: Text(
                      values[value] ?? '',
                      style: TextStyles.textStyle12.copyWith(
                        color: AppColors.pastelBlue,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                },
              ),
            ),
            leftTitles: const AxisTitles(),
            rightTitles: const AxisTitles(),
            topTitles: const AxisTitles(),
          ),
          lineTouchData: LineTouchData(
            getTouchedSpotIndicator: (barData, spotIndexes) {
              return spotIndexes.map((index) {
                return TouchedSpotIndicatorData(
                  const FlLine(),
                  FlDotData(
                    show: true,
                    getDotPainter: (p0, p1, p2, p3) {
                      return FlDotCirclePainter(
                        color: AppColors.yellow,
                        strokeColor: AppColors.white,
                        strokeWidth: 12.3,
                        radius: 7.5,
                      );
                    },
                  ),
                );
              }).toList();
            },
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: AppColors.white,
              tooltipMargin: 25.h,
              fitInsideHorizontally: true,
              fitInsideVertically: true,
              getTooltipItems: (touchedSpots) {
                return touchedSpots
                    .map(
                      (touchedSpot) => LineTooltipItem(
                        '${touchedSpot.y}',
                        TextStyles.textStyle12.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    )
                    .toList();
              },
            ),
          ),
          gridData: const FlGridData(
            show: false,
          ),
          lineBarsData: [
            LineChartBarData(
              spots: (livePrices != null && livePrices!.length == 8)
                  ? [
                      FlSpot(0, livePrices![0].price),
                      FlSpot(1, livePrices![1].price),
                      FlSpot(2, livePrices![2].price),
                      FlSpot(3, livePrices![3].price),
                      FlSpot(4, livePrices![4].price),
                      FlSpot(5, livePrices![5].price),
                      FlSpot(6, livePrices![6].price),
                      FlSpot(7, livePrices![7].price),
                      FlSpot(8, livePrices![7].price),
                    ]
                  : List.generate(9, (index) => FlSpot(index.toDouble(), 0)),
              isCurved: true,
              color: const Color(0xFFF0E703).withOpacity(0.5),
              barWidth: 5.6.w,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: AppColors.yellow.withOpacity(0.05),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
