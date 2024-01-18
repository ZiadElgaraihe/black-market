import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
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
          onPressed: onPressed,
          splashRadius: 12.w,
          icon: SvgPicture.asset(
            AppIcons.assetsIconsShare,
            width: 25.w,
            height: 25.h,
          ),
        ),
      ),
    );
  }
}
