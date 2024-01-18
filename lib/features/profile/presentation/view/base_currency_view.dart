import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/app_bars/default_app_bar.dart';
import 'package:black_market/features/profile/presentation/view/widgets/base_currency_view_body.dart';
import 'package:flutter/material.dart';

class BaseCurrencyView extends StatelessWidget {
  const BaseCurrencyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: Tr.of(context).baseCurrency),
      body: const BaseCurrencyViewBody(),
    );
  }
}