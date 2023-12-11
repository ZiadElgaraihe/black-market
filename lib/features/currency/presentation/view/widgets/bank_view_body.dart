import 'package:black_market/features/currency/presentation/view/widgets/sections/bank_currency_section.dart';
import 'package:black_market/features/currency/presentation/view/widgets/sections/bank_header_section.dart';
import 'package:flutter/material.dart';

class BankViewBody extends StatelessWidget {
  const BankViewBody({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          BankHeaderSection(index: index),
          const BankCurrencySection(),
        ],
      ),
    );
  }
}
