import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrencyHeaderProfileInfoRow extends StatelessWidget {
  const CurrencyHeaderProfileInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          children: [
            Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2.w,
                  color: AppColors.grey,
                ),
              ),
              child: Icon(
                Icons.person_rounded,
                color: AppColors.grey,
                size: 22.w,
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'مرحباً',
                  style: TextStyles.textStyle12.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                Text(
                  'علي عبدالله',
                  style: TextStyles.textStyle14,
                )
              ],
            ),
            const Spacer(),
            Container(
              height: 48.h,
              width: 48.w,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: AppColors.black),
              child: Material(
                color: AppColors.transparent,
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppIcons.assetsIconsNotification,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
