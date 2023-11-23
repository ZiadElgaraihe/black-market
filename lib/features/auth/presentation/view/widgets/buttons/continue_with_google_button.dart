import 'package:black_market/core/functions/future_delayd_navigator.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_images.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContinueWithGoogleButton extends StatelessWidget {
  const ContinueWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        futureDelayedNavigator(() {});
      },
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(
          Size(327.w, 52.h),
        ),
        backgroundColor: MaterialStatePropertyAll(AppColors.darkGrey),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.w),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.assetsImagesGoogle,
            height: 20.h,
            width: 20.w,
          ),
          SizedBox(width: 10.w),
          Text(
            'اكمل باستخدام جوجل',
            style: TextStyles.textStyle14,
          ),
        ],
      ),
    );
  }
}
