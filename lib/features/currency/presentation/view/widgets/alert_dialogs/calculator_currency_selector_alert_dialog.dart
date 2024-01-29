import 'package:black_market/core/functions/future_delayd_navigator.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatorCurrencySelectorAlertDialog extends StatelessWidget {
  const CalculatorCurrencySelectorAlertDialog({
    super.key,
    required this.currencies,
    required this.bankId,
    required this.currencyIndexValueNotifier,
    required this.valueInEgyptianPound,
    required this.controller,
  });

  final List<CurrencyModel> currencies;
  final int bankId;
  final ValueNotifier<int> currencyIndexValueNotifier;
  final ValueNotifier<double> valueInEgyptianPound;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 100.h),
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        content: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 450.h,
            minWidth: 250.w,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                currencies.length,
                (index) => (currencies[index]
                            .bankPrices
                            .where((element) => element.bankId == bankId)
                            .firstOrNull !=
                        null)
                    ? InkWell(
                        onTap: () {
                          futureDelayedNavigator(() {
                            currencyIndexValueNotifier.value = index;
                            valueInEgyptianPound.value = currencies[index]
                                    .bankPrices
                                    .firstWhere(
                                        (element) => element.bankId == bankId)
                                    .buyPrice! *
                                (double.tryParse(controller.text) ?? 1);
                            Navigator.pop(context);
                          });
                        },
                        borderRadius: BorderRadius.circular(10.w),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 5.h,
                          ),
                          child: Text(
                            currencies[index].name,
                            style: TextStyles.textStyle14,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
