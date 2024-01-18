import 'package:black_market/core/functions/future_delayd_navigator.dart';
import 'package:black_market/core/presentation/view_model/localization_cubit/localization_cubit.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileItemContainerButton extends StatelessWidget {
  const ProfileItemContainerButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.title,
  });

  final String icon;
  final void Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(14.w),
      ),
      child: Material(
        color: AppColors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14.w),
          onTap: () {
            futureDelayedNavigator(() {
              onTap();
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.5.w, vertical: 13.h),
            child: Row(
              children: [
                SvgPicture.asset(
                  icon,
                  height: 22.h,
                  width: 22.w,
                  colorFilter: ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcATop,
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  title,
                  style: TextStyles.textStyle14.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  context.read<LocalizationCubit>().isArabic()
                      ? AppIcons.assetsIconsArrowLeft
                      : AppIcons.assetsIconsArrowRight,
                  height: 22.h,
                  width: 22.w,
                  colorFilter: ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcATop,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
