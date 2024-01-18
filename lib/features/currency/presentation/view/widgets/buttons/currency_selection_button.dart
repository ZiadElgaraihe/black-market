import 'package:black_market/core/functions/future_delayd_navigator.dart';
import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrencySelectionButton extends StatelessWidget {
  const CurrencySelectionButton({
    super.key,
    this.currencies,
    required this.currentIndexValueNotifier,
  });

  final List<CurrencyModel>? currencies;
  final ValueNotifier<int> currentIndexValueNotifier;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: () {
          futureDelayedNavigator(() {
            _showCurrencies(context);
          });
        },
        borderRadius: BorderRadius.circular(2.5.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              (currencies != null)
                  ? currencies![currentIndexValueNotifier.value].name
                  : 'N/A',
              style: TextStyles.textStyle10.copyWith(
                color: AppColors.darkGrey,
              ),
            ),
            SizedBox(width: 6.w),
            SizedBox(
              width: 16.w,
              height: 16.h,
              child: SvgPicture.asset(
                AppIcons.assetsIconsArrowDown,
                colorFilter: ColorFilter.mode(
                  AppColors.darkGrey,
                  BlendMode.srcATop,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCurrencies(BuildContext context) {
    if (currencies != null) {
      showAlertDialog(
        context,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.w),
          ),
          content: SizedBox(
            height: 450.h,
            width: 250.w,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: currencies!.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  futureDelayedNavigator(() {
                    currentIndexValueNotifier.value = index;
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
                    currencies![index].name,
                    style: TextStyles.textStyle14,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              separatorBuilder: (context, index) =>
                  (index != currencies!.length - 1)
                      ? Divider(
                          color: AppColors.lightGrey,
                          thickness: 0.5.h,
                          indent: 5.w,
                          endIndent: 5.w,
                        )
                      : const SizedBox(),
            ),
          ),
        ),
      );
    }
  }
}
