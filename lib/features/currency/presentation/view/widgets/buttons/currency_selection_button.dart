import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/app_images.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrencySelectionButton extends StatelessWidget {
  const CurrencySelectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(2.5.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 16.w,
              height: 14.h,
              child: SvgPicture.asset(
                AppImages.assetsImagesEgyptFlag,
              ),
            ),
            SizedBox(width: 6.w),
            Text(
              'دولار أمريكي / USD',
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
}
