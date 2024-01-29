import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/app_bars/default_app_bar.dart';
import 'package:black_market/features/gold/presentation/view/widgets/gold_view_body.dart';
import 'package:flutter/material.dart';

class GoldView extends StatelessWidget {
  const GoldView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: Tr.of(context).gold),
      body: const GoldViewBody(),
    );
  }
}
