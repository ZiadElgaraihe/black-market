import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/buttons/default_button.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_images.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangePasswordSuccessModalBottomSheet extends StatelessWidget {
  const ChangePasswordSuccessModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 46.h,
        right: 24.w,
        bottom: 48.h,
        left: 24.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32.w),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            AppImages.assetsImagesSuccess,
            height: 147.h,
            width: 164.6.w,
          ),
          SizedBox(height: 43.h),
          Text(
            Tr.of(context).passwordChangedSuccessfully,
            style: TextStyles.textStyle22.copyWith(
              color: AppColors.yellow,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 50.h),
          DefaultButton(
            onPressed: () {},
            title: Tr.of(context).home,
          ),
        ],
      ),
    );
  }
}
