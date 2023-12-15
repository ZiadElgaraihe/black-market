import 'package:black_market/core/presentation/view/app_bars/default_app_bar.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/currency/presentation/view/widgets/bank_view_body.dart';
import 'package:flutter/material.dart';

class BankView extends StatelessWidget {
  const BankView({
    super.key,
    required this.index,
  });

  final int index;

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
        body: BankViewBody(index: index),
      ),
    );
  }
}
