import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:black_market/features/currency/presentation/view/widgets/rows/bank_different_currencies_title_row.dart';
import 'package:black_market/features/currency/presentation/view/widgets/rows/bank_different_currencies_values_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankDifferentCurrenciesContainer extends StatelessWidget {
  const BankDifferentCurrenciesContainer({
    super.key,
    required this.bankId,
    required this.currencies,
  });

  final int bankId;
  final List<CurrencyModel> currencies;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: AppColors.darkGrey,
      ),
      child: Column(
        children: [
          const BankDifferentCurrenciesTitlesRow(),
          SizedBox(height: 12.h),
          Divider(
            color: const Color(0xFF967373),
            thickness: 1.h,
          ),
          SizedBox(height: 12.h),
          Column(
            children: List.generate(
              currencies.length,
              (index) => BankDifferentCurrenciesValuesRow(
                bankId: bankId,
                currency: currencies[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
