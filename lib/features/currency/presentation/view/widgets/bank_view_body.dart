import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:black_market/features/currency/presentation/view/widgets/sections/bank_currency_section.dart';
import 'package:black_market/features/currency/presentation/view/widgets/sections/bank_header_section.dart';
import 'package:flutter/material.dart';

class BankViewBody extends StatelessWidget {
  const BankViewBody({
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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          BankHeaderSection(
            bankId: bankId,
            currency: currencies[currencyIndex],
          ),
          BankCurrencySection(
            bankId: bankId,
            currencies: currencies,
            currencyIndex: currencyIndex,
          ),
        ],
      ),
    );
  }
}
