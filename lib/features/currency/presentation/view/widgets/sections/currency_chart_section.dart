import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/currency/presentation/view/widgets/charts/currency_chart.dart';
import 'package:black_market/features/currency/presentation/view_model/currency_latest_cubit/currency_latest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyChartSection extends StatelessWidget {
  const CurrencyChartSection({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: BlocBuilder<CurrencyLatestCubit, CurrencyLatestState>(
        builder: (context, state) {
          if (state is CurrencyLatestLoading) {
            return SizedBox(
              height: 268.h,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.yellow,
                ),
              ),
            );
          } else {
            return CurrencyChart(
              livePrices: context
                  .read<CurrencyLatestCubit>()
                  .currencies?[currentIndex]
                  .livePrices,
            );
          }
        },
      ),
    );
  }
}
