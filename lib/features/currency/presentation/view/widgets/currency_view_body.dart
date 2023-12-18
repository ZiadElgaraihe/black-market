import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/currency/presentation/view/widgets/sections/currency_average_price_section.dart';
import 'package:black_market/features/currency/presentation/view/widgets/sections/currency_bank_section.dart';
import 'package:black_market/features/currency/presentation/view/widgets/sections/currency_chart_section.dart';
import 'package:black_market/features/currency/presentation/view/widgets/sections/currency_header_section.dart';
import 'package:black_market/features/currency/presentation/view_model/currency_latest/currency_latest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyViewBody extends StatelessWidget {
  const CurrencyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<CurrencyLatestCubit>().getLatest(),
      builder: (context, snapshot) => RefreshIndicator(
        onRefresh: () async {
          context.read<CurrencyLatestCubit>().getLatest(isReload: true);
        },
        color: AppColors.yellow,
        child: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CurrencyHeaderSection(),
              CurrencyChartSection(),
              CurrencyAveragePriceSection(),
              CurrencyBankSection(),
            ],
          ),
        ),
      ),
    );
  }
}
