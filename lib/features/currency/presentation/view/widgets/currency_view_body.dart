import 'package:black_market/features/currency/presentation/view/widgets/sections/currency_chart_section.dart';
import 'package:black_market/features/currency/presentation/view/widgets/sections/currency_average_price_section.dart';
import 'package:black_market/features/currency/presentation/view/widgets/sections/currency_bank_section.dart';
import 'package:black_market/features/currency/presentation/view/widgets/sections/currency_header_section.dart';
import 'package:flutter/material.dart';

class CurrencyViewBody extends StatelessWidget {
  const CurrencyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          CurrencyHeaderSection(),
          CurrencyChartSection(),
          CurrencyAveragePriceSection(),
          CurrencyBankSection(),
        ],
      ),
    );
  }
}
