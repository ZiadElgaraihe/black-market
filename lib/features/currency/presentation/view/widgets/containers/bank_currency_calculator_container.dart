import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/currency/presentation/view/widgets/rows/calculator_currency_selector_row.dart';
import 'package:black_market/features/currency/presentation/view/widgets/rows/currency_comparison_row.dart';
import 'package:black_market/features/currency/presentation/view/widgets/text_fields/money_value_converter_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankCurrencyCalculatorContainer extends StatelessWidget {
  const BankCurrencyCalculatorContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 18.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 11.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: AppColors.darkGrey,
      ),
      child: Column(
        children: [
          const CalculatorCurrencySelectorRow(),
          SizedBox(height: 11.h),
          const MoneyValueConverterTextField(),
          SizedBox(height: 11.h),
          const CurrencyComparisonRow()
        ],
      ),
    );
  }
}
