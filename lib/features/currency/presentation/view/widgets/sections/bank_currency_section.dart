import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:black_market/features/currency/presentation/view/widgets/containers/bank_currency_buy_and_sell_container.dart';
import 'package:black_market/features/currency/presentation/view/widgets/containers/bank_currency_calculator_container.dart';
import 'package:black_market/features/currency/presentation/view/widgets/containers/bank_different_currencies_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankCurrencySection extends StatelessWidget {
  const BankCurrencySection({
    super.key,
    required this.bankId,
    required this.currencies,
    required this.currencyIndex,
  });

  final int bankId;
  final List<CurrencyModel> currencies;
  final int currencyIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          BankCurrencyBuyAndSellContainer(
            bankId: bankId,
            currency: currencies[currencyIndex],
          ),
          BankCurrencyCalculatorContainer(
            bankId: bankId,
            currencies: currencies,
            currencyIndex: currencyIndex,
          ),
          BankDifferentCurrenciesContainer(
            bankId: bankId,
            currencies: currencies,
          ),
        ],
      ),
    );
  }
}