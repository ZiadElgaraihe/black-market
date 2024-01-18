import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyChart extends StatelessWidget {
  const CurrencyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 268.h,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 8,
          minY: 10,
          maxY: 39,
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32.h,
                getTitlesWidget: (value, meta) {
                  Map<double, String> values = {
                    1: 'سبت',
                    2: 'حد',
                    3: 'اثنين',
                    4: 'ثلاثاء',
                    5: 'أربعاء',
                    6: 'خميس',
                    7: 'جمعة',
                  };
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
              spots: [
                const FlSpot(0, 20),
                const FlSpot(1, 15),
                const FlSpot(2, 25),
                const FlSpot(3, 18),
                const FlSpot(4, 28),
                const FlSpot(5, 22),
                const FlSpot(6, 24),
                const FlSpot(7, 35),
                const FlSpot(8, 32),
              ],
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