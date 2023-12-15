import 'package:black_market/features/currency/presentation/view/widgets/columns/bank_header_price_content_column.dart';
import 'package:black_market/features/currency/presentation/view/widgets/columns/currency_header_app_info_column.dart';
import 'package:black_market/features/currency/presentation/view/widgets/containers/header_background_container.dart';
import 'package:black_market/features/currency/presentation/view/widgets/containers/header_price_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankHeaderSection extends StatelessWidget {
  const BankHeaderSection({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.h,
      child: Stack(
        children: [
          const HeaderBackgroundContainer(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 18.h),
                const CurrencyHeaderAppInfoColumn(),
                SizedBox(height: 35.h),
                HeaderPriceContainer(
                  child: BankHeaderPriceContentColumn(index: index),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
