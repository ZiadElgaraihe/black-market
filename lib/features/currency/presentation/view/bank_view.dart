import 'package:black_market/core/presentation/view/app_bars/default_app_bar.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:black_market/features/currency/presentation/view/widgets/bank_view_body.dart';
import 'package:flutter/material.dart';

class BankView extends StatelessWidget {
  const BankView({
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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: DefaultAppBar(
          backButtonBackgroundColor: AppColors.black,
          title: '',
        ),
        body: BankViewBody(
          bankId: bankId,
          currencies: currencies,
          currencyIndex: currencyIndex,
        ),
      ),
    );
  }
}
