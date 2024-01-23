import 'package:black_market/core/animations/side_slide_transition.dart';
import 'package:black_market/core/functions/future_delayd_navigator.dart';
import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/alert_dialogs/result_alert_dialog.dart';
import 'package:black_market/core/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:black_market/core/presentation/view_model/favourite_cubit/favourite_cubit.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/features/auth/presentation/view/log_in_view.dart';
import 'package:black_market/features/currency/data/models/currency_price_model/currency_price_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({
    super.key,
    this.bankPrice,
  });

  final CurrencyPriceModel? bankPrice;

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  final ValueNotifier<bool> _isFavourite = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isFavourite.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _checkIfFavourite(context);
    return Container(
      height: 35.h,
      width: 35.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.grey,
          width: 0.5.w,
        ),
      ),
      child: Material(
        color: AppColors.transparent,
        child: IconButton(
          onPressed: () {
            futureDelayedNavigator(() {
              _addAndRemoveFromFavourite(context);
            });
          },
          splashRadius: 12.w,
          icon: ValueListenableBuilder(
            valueListenable: _isFavourite,
            builder: (context, isFavourite, child) => (isFavourite)
                ? SvgPicture.asset(
                    AppIcons.assetsIconsHeartPressed,
                    width: 25.w,
                    height: 25.h,
                  )
                : SvgPicture.asset(
                    AppIcons.assetsIconsHeart,
                    width: 25.w,
                    height: 25.h,
                  ),
          ),
        ),
      ),
    );
  }

  void _addAndRemoveFromFavourite(BuildContext context) {
    if (context.read<AppCubit>().userModel != null) {
      if (widget.bankPrice?.id != null) {
        if (_isFavourite.value) {
          context.read<FavouriteCubit>().removeFromFavourite(
                bankPrice: widget.bankPrice!,
              );
        } else {
          context.read<FavouriteCubit>().addToFavourite(
                bankPrice: widget.bankPrice!,
              );
        }
        _isFavourite.value = !_isFavourite.value;
      }
    } else {
      showAlertDialog(
        context,
        child: ResultAlertDialog(
          buttonTitle: Tr.of(context).logIn,
          message: Tr.of(context).youMustLogInFirst,
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              SideSlideTransition(
                page: const LogInView(),
              ),
            );
          },
          title: Tr.of(context).alert,
        ),
      );
    }
  }

  void _checkIfFavourite(BuildContext context) {
    if (context.read<AppCubit>().userModel != null) {
      FavouriteCubit favouriteCubit = context.read<FavouriteCubit>();
      for (int index = 0;
          index < favouriteCubit.favouriteData.length;
          index++) {
        if (favouriteCubit.favouriteData[index].id == widget.bankPrice?.id) {
          _isFavourite.value = true;
          break;
        }
        //use this else if condition to solve the problem of _isFavourite is come
        //with value true when currency is changed and the index is equal to the
        //index of the bank added to favourite in the previous currency
        else if (index == favouriteCubit.favouriteData.length - 1) {
          _isFavourite.value = false;
        }
      }
    }
  }
}
