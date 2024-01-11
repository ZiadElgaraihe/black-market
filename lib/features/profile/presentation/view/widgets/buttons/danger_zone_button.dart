import 'package:black_market/core/functions/future_delayd_navigator.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DangerZoneButton extends StatelessWidget {
  const DangerZoneButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.title,
  });

  final String icon;
  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        futureDelayedNavigator(() {
          onPressed();
        });
      },
      style: ButtonStyle(
        overlayColor: MaterialStatePropertyAll(
          AppColors.red.withOpacity(0.1),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            height: 30.h,
            width: 30.w,
          ),
          SizedBox(width: 12.w),
          Text(
            title,
            style: TextStyles.textStyle14.copyWith(
              color: AppColors.red,
            ),
          ),
        ],
      ),
    );
  }
}
