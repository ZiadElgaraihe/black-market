import 'package:black_market/core/functions/future_delayd_navigator.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 35.w,
      margin: EdgeInsetsDirectional.only(end: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.w),
        color: AppColors.darkGrey,
      ),
      child: Material(
        color: AppColors.transparent,
        child: InkWell(
          onTap: () {
            futureDelayedNavigator(() {
              onTap();
            });
          },
          borderRadius: BorderRadius.circular(16.w),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: SvgPicture.asset(
              AppIcons.assetsIconsEditSquare,
              height: 20.h,
              width: 20.w,
            ),
          ),
        ),
      ),
    );
  }
}
