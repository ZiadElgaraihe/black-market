import 'package:black_market/core/functions/future_delayd_navigator.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencySelectionAlertDialog extends StatelessWidget {
  const CurrencySelectionAlertDialog({
    super.key,
    required this.currencies,
    required this.currentIndexValueNotifier,
  });

  final List<CurrencyModel>? currencies;
  final ValueNotifier<int> currentIndexValueNotifier;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
    );
  }
}
