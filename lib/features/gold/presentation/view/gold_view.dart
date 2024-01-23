import 'package:black_market/features/gold/presentation/view/widgets/gold_view_app_bar.dart';
import 'package:black_market/features/gold/presentation/view/widgets/gold_view_body.dart';
import 'package:flutter/material.dart';

class GoldView extends StatelessWidget {
  const GoldView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GoldViewAppBar(),
      body: GoldViewBody(),
    );
  }
}
