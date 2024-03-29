import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:black_market/features/currency/presentation/view/widgets/rows/calculator_currency_selector_row.dart';
import 'package:black_market/features/currency/presentation/view/widgets/rows/currency_comparison_row.dart';
import 'package:black_market/features/currency/presentation/view/widgets/text_fields/money_value_converter_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankCurrencyCalculatorContainer extends StatefulWidget {
  const BankCurrencyCalculatorContainer({
    super.key,
    required this.bankId,
    required this.currencies,
    required this.currencyIndex,
  });

  final int bankId;
  final List<CurrencyModel> currencies;
  final int currencyIndex;

  @override
  State<BankCurrencyCalculatorContainer> createState() =>
      _BankCurrencyCalculatorContainerState();
}

class _BankCurrencyCalculatorContainerState
    extends State<BankCurrencyCalculatorContainer> {
  final TextEditingController _controller = TextEditingController();
  late final ValueNotifier<double> _valueInEgyptianPound;
  late final ValueNotifier<int> _currentCalculatorCurrencyIndex;

  @override
  void initState() {
    _currentCalculatorCurrencyIndex = ValueNotifier<int>(widget.currencyIndex);
    _valueInEgyptianPound = ValueNotifier<double>(
      widget.currencies[widget.currencyIndex].bankPrices
          .firstWhere((element) => element.bankId == widget.bankId)
          .buyPrice!,
    );
    super.initState();
  }

  @override
  void dispose() {
    _currentCalculatorCurrencyIndex.dispose();
    _valueInEgyptianPound.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 18.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 11.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: AppColors.darkGrey,
      ),
      child: ValueListenableBuilder(
        valueListenable: _currentCalculatorCurrencyIndex,
        builder: (context, currentCalculatorCurrencyIndex, child) => Column(
          children: [
            CalculatorCurrencySelectorRow(
              bankId: widget.bankId,
              controller: _controller,
              currencies: widget.currencies,
              currencyIndexValueNotifier: _currentCalculatorCurrencyIndex,
              valueInEgyptianPound: _valueInEgyptianPound,
            ),
            SizedBox(height: 11.h),
            MoneyValueConverterTextField(
              bankId: widget.bankId,
              controller: _controller,
              currency: widget.currencies[currentCalculatorCurrencyIndex],
              valueInEgyptianPound: _valueInEgyptianPound,
            ),
            SizedBox(height: 11.h),
            CurrencyComparisonRow(
              controller: _controller,
              currency: widget.currencies[currentCalculatorCurrencyIndex],
              valueInEgyptianPound: _valueInEgyptianPound,
            )
          ],
        ),
      ),
    );
  }
}
