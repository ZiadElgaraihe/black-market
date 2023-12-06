import 'package:black_market/features/currency/presentation/view/widgets/currency_view_body.dart';
import 'package:flutter/material.dart';

class CurrencyView extends StatelessWidget {
  const CurrencyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CurrencyViewBody(),
    );
  }
}
