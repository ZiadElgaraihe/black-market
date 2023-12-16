import 'package:black_market/features/currency/presentation/view/widgets/blocs/currency_header_price_bloc_consumer.dart';
import 'package:black_market/features/currency/presentation/view/widgets/columns/currency_header_app_info_column.dart';
import 'package:black_market/features/currency/presentation/view/widgets/containers/header_background_container.dart';
import 'package:black_market/features/currency/presentation/view/widgets/containers/header_price_container.dart';
import 'package:black_market/features/currency/presentation/view/widgets/rows/currency_header_profile_info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyHeaderSection extends StatelessWidget {
  const CurrencyHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.h,
      child: Stack(
        children: [
          const HeaderBackgroundContainer(),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 4.h),
                const CurrencyHeaderProfileInfoRow(),
                SizedBox(height: 26.h),
                const CurrencyHeaderAppInfoColumn(),
                SizedBox(height: 30.h),
                const HeaderPriceContainer(
                  child: CurrencyHeaderPriceBlocConsumer(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
