import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/gold/presentation/view/widgets/rows/gold_bars_and_icons_data_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoldListItemExpansionTile extends StatefulWidget {
  const GoldListItemExpansionTile({
    super.key,
    required this.title,
  });

  final String title;

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
        widget.title,
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
        const GoldBarsAndIconsDataRow(
          title: 'سعر الجرام',
          price: '2500',
        ),
        const GoldBarsAndIconsDataRow(
          title: 'مصنعية الجرام',
          price: '2500',
        ),
        const GoldBarsAndIconsDataRow(
          title: 'الضربية الكلية',
          price: '2500',
        ),
        GoldBarsAndIconsDataRow(
          title: 'السعر شامل الضريبة و المصنعية',
          price: '2500',
          textStyle: TextStyles.textStyle14.copyWith(
            color: AppColors.yellow,
          ),
        ),
        const GoldBarsAndIconsDataRow(
          title: 'مبلغ الاستيراد',
          price: '2500',
        ),
        const GoldBarsAndIconsDataRow(
          title: 'الفرق',
          price: '2500',
        ),
      ],
    );
  }
}
