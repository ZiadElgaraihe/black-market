import 'package:black_market/core/functions/future_delayd_navigator.dart';
import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalculatorCurrencySelectorButton extends StatelessWidget {
  const CalculatorCurrencySelectorButton({
    super.key,
    required this.bankId,
    required this.controller,
    required this.currencies,
    required this.currencyIndexValueNotifier,
    required this.valueInEgyptianPound,
  });

  final int bankId;
  final TextEditingController controller;
  final List<CurrencyModel> currencies;
  final ValueNotifier<int> currencyIndexValueNotifier;
  final ValueNotifier<double> valueInEgyptianPound;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showBankCurrencies(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 5.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.w),
          color: AppColors.white,
        ),
        child: Row(
          children: [
            Text(
              currencies[currencyIndexValueNotifier.value]
                  .name
                  .split('/')
                  .first,
              style: TextStyles.textStyle7.copyWith(
                color: AppColors.black,
              ),
            ),
            SizedBox(width: 4.7.w),
            SvgPicture.asset(
              AppIcons.assetsIconsArrowDown,
              height: 11.h,
              width: 11.w,
              colorFilter: ColorFilter.mode(
                AppColors.darkGrey,
                BlendMode.srcATop,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBankCurrencies(BuildContext context) {
    showAlertDialog(
      context,
      child: Padding(
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
      ),
    );
  }
}
