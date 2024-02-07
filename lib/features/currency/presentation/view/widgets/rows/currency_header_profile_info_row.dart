import 'package:black_market/core/animations/side_slide_transition.dart';
import 'package:black_market/core/functions/future_delayd_navigator.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/constants.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/notifications/presentation/view/notifications_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            (context.read<AppCubit>().userModel != null)
                ? CircleAvatar(
                    radius: 24.w,
                    backgroundColor: AppColors.grey,
                    child: Padding(
                      padding: EdgeInsets.all(2.w),
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl:
                              context.read<AppCubit>().userModel!.user.avatar,
                          progressIndicatorBuilder: (context, url, progress) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 13.5.w,
                                vertical: 10.h,
                              ),
                              child: CircularProgressIndicator(
                                color: AppColors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                : Container(
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
              mainAxisAlignment: (context.read<AppCubit>().userModel != null)
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Tr.of(context).welcome,
                  style: TextStyles.textStyle12.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                if (context.read<AppCubit>().userModel != null)
                  Text(
                    context.read<AppCubit>().userModel!.user.name,
                    style: TextStyles.textStyle14,
                  )
              ],
            ),
            const Spacer(),
            Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.black,
              ),
              child: Material(
                color: AppColors.transparent,
                child: IconButton(
                  splashRadius: isTablet ? 17.w : 20.5.w,
                  onPressed: () {
                    futureDelayedNavigator(() {
                      Navigator.push(
                        context,
                        SideSlideTransition(
                          page: const NotificationsView(),
                        ),
                      );
                    });
                  },
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
