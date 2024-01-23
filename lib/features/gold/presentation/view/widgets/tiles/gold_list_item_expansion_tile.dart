import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/gold/data/models/ingots_coins/ingots_coins_model.dart';
import 'package:black_market/features/gold/presentation/view/widgets/rows/gold_ingots_and_coins_data_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoldListItemExpansionTile extends StatefulWidget {
  const GoldListItemExpansionTile({
    super.key,
    this.isCoin = false,
    this.company,
    this.price,
    this.weight,
  });

  final CompanyDataModel? company;
  final bool isCoin;
  final PriceModel? price;
  final double? weight;

  @override
  State<GoldListItemExpansionTile> createState() =>
      _GoldListItemExpansionTileState();
}

class _GoldListItemExpansionTileState extends State<GoldListItemExpansionTile> {
  final ValueNotifier<bool> _isExpanded = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isExpanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        (widget.weight != null)
            ? (widget.isCoin)
                ? '${widget.weight! / 8} ${Tr.of(context).pound} - ${widget.weight} ${Tr.of(context).gram}'
                : '${widget.weight} ${Tr.of(context).gram}'
            : Tr.of(context).unknown,
        style: TextStyles.textStyle16.copyWith(
          color: AppColors.white,
        ),
      ),
      iconColor: AppColors.white,
      backgroundColor: AppColors.darkGrey,
      tilePadding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: AppColors.yellow,
          width: 0.5.w,
        ),
        borderRadius: BorderRadius.circular(10.w),
      ),
      collapsedIconColor: AppColors.white,
      collapsedBackgroundColor: AppColors.darkGrey,
      childrenPadding: EdgeInsets.only(right: 22.w, bottom: 20.h, left: 22.w),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.w),
      ),
      onExpansionChanged: (value) {
        _isExpanded.value = value;
      },
      trailing: ValueListenableBuilder(
        valueListenable: _isExpanded,
        builder: (context, isExpanded, child) => isExpanded
            ? SvgPicture.asset(
                AppIcons.assetsIconsArrowUp,
                height: 22.h,
                width: 22.w,
              )
            : SvgPicture.asset(
                AppIcons.assetsIconsArrowDown,
                height: 22.h,
                width: 22.w,
              ),
      ),
      children: [
        Divider(
          thickness: 2.h,
          indent: 5.w,
          endIndent: 5.w,
        ),
        GoldIngotsAndCoinsDataRow(
          title: Tr.of(context).pricePerGram,
          price: (widget.price != null && widget.weight != null)
              ? '${widget.price!.buyPrice / widget.weight!}'
              : null,
        ),
        GoldIngotsAndCoinsDataRow(
          title: Tr.of(context).workmanshipPerGram,
          price: (widget.company != null)
              ? '${widget.company!.workmanship}'
              : null,
        ),
        GoldIngotsAndCoinsDataRow(
          title: Tr.of(context).totalTax,
          price: (widget.company != null)
              ? '${widget.company!.tax + widget.company!.workmanship}'
              : null,
        ),
        GoldIngotsAndCoinsDataRow(
          title: Tr.of(context).priceIncludesTaxAndWorkmanship,
          price: (widget.price != null && widget.company != null)
              ? '${widget.price!.buyPrice + widget.company!.tax + widget.company!.workmanship}'
              : (widget.price != null)
                  ? '${widget.price!.buyPrice}'
                  : null,
          textStyle: TextStyles.textStyle14.copyWith(
            color: AppColors.yellow,
          ),
        ),
        GoldIngotsAndCoinsDataRow(
          title: Tr.of(context).importPrice,
          price:
              (widget.company != null) ? '${widget.company!.returnFees}' : null,
        ),
        GoldIngotsAndCoinsDataRow(
          title: Tr.of(context).difference,
          price: (widget.price != null)
              ? '${widget.price!.buyPrice - widget.price!.sellPrice}'
              : null,
        ),
      ],
    );
  }
}
