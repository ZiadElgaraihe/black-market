import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgetPasswordWarningMessageContainer extends StatelessWidget {
  const ForgetPasswordWarningMessageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        top: 16.h,
        start: 14.w,
        bottom: 15.h,
        end: 15.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        color: AppColors.darkGrey,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.assetsIconsWarningIcon,
            height: 24.h,
            width: 24.w,
            colorFilter: ColorFilter.mode(
              AppColors.lightYellowHover,
              BlendMode.srcATop,
            ),
          ),
          SizedBox(width: 16.w),
          SizedBox(
            width: 258.w,
            child: Text(
              Tr.of(context)
                  .weWillSendAnOTPCodeToYourEmailForSecurityWhenYouForgetYourPassword,
              style: TextStyles.textStyle12.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.lightYellowHover,
                height: 1.h,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
