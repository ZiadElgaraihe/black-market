import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:black_market/features/currency/presentation/view/widgets/alert_dialogs/calculator_currency_selector_alert_dialog.dart';
import 'package:black_market/features/currency/presentation/view/widgets/cached_network_images/currency_icon_cached_network_image.dart';
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
            CurrencyIconCachedNetworkImage(
              height: 12.h,
              width: 12.w,
              imageUrl: currencies[currencyIndexValueNotifier.value].icon,
            ),
            SizedBox(width: 4.7.w),
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
      child: CalculatorCurrencySelectorAlertDialog(
        currencies: currencies,
        bankId: bankId,
        currencyIndexValueNotifier: currencyIndexValueNotifier,
        valueInEgyptianPound: valueInEgyptianPound,
        controller: controller,
      ),
    );
  }
}
