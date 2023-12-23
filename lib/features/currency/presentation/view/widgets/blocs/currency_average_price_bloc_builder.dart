import 'package:black_market/features/currency/presentation/view/widgets/rows/currency_average_price_content_row.dart';
import 'package:black_market/features/currency/presentation/view/widgets/rows/currency_average_price_shimmer_row.dart';
import 'package:black_market/features/currency/presentation/view_model/currency_latest/currency_latest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyAveragePriceBlocBuilder extends StatelessWidget {
  const CurrencyAveragePriceBlocBuilder({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyLatestCubit, CurrencyLatestState>(
      builder: (context, state) {
        if (state is CurrencyLatestLoading) {
          return const CurrencyAveragePriceShimmerRow();
        } else if (state is CurrencyLatestSuccess) {
          return CurrencyAveragePriceContentRow(
            currencies: state.currencies,
            currentIndex: currentIndex,
          );
        } else if (state is CurrencyLatestFailure) {
          return CurrencyAveragePriceContentRow(
            currencies: state.currencies,
            currentIndex: currentIndex,
          );
        } else {
          return CurrencyAveragePriceContentRow(
            currentIndex: currentIndex,
          );
        }
      },
    );
  }
}
