import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/currency/presentation/view/widgets/sections/currency_average_price_section.dart';
import 'package:black_market/features/currency/presentation/view/widgets/sections/currency_bank_section.dart';
import 'package:black_market/features/currency/presentation/view/widgets/sections/currency_chart_section.dart';
import 'package:black_market/features/currency/presentation/view/widgets/sections/currency_header_section.dart';
import 'package:black_market/features/currency/presentation/view_model/currency_latest_cubit/currency_latest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyViewBody extends StatefulWidget {
  const CurrencyViewBody({super.key});

  @override
  State<CurrencyViewBody> createState() => _CurrencyViewBodyState();
}

class _CurrencyViewBodyState extends State<CurrencyViewBody> {
  final ValueNotifier<int> _currentIndexValueNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    _currentIndexValueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<CurrencyLatestCubit>().getLatest(),
      builder: (context, snapshot) => RefreshIndicator(
        onRefresh: () async {
          context.read<CurrencyLatestCubit>().getLatest(isReload: true);
        },
        color: AppColors.yellow,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ValueListenableBuilder(
            valueListenable: _currentIndexValueNotifier,
            builder: (context, currentIndex, child) => Column(
              children: [
                CurrencyHeaderSection(
                  currentIndexValueNotifier: _currentIndexValueNotifier,
                ),
                const CurrencyChartSection(),
                CurrencyAveragePriceSection(
                  currentIndex: currentIndex,
                ),
                CurrencyBankSection(
                  currentIndex: currentIndex,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
