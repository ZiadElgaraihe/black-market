import 'package:black_market/core/functions/future_delayd_navigator.dart';
import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:black_market/features/currency/presentation/view/widgets/alert_dialogs/currency_selection_alert_dialog.dart';
import 'package:black_market/features/currency/presentation/view/widgets/cached_network_images/currency_icon_cached_network_image.dart';
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
            if (currencies != null)
              CurrencyIconCachedNetworkImage(
                height: 16.h,
                width: 16.w,
                imageUrl: currencies![currentIndexValueNotifier.value].icon,
              ),
            if (currencies != null) SizedBox(width: 6.w),
            Text(
              (currencies != null)
                  ? currencies![currentIndexValueNotifier.value].name
                  : Tr.of(context).unknown,
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
        child: CurrencySelectionAlertDialog(
          currencies: currencies,
          currentIndexValueNotifier: currentIndexValueNotifier,
        ),
      );
    }
  }
}
