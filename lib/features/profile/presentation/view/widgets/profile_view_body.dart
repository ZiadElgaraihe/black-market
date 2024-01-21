import 'package:black_market/core/animations/side_slide_transition.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/buttons/default_button.dart';
import 'package:black_market/core/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/auth/presentation/view/log_in_view.dart';
import 'package:black_market/features/profile/presentation/view/base_currency_view.dart';
import 'package:black_market/features/profile/presentation/view/edit_profile_view.dart';
import 'package:black_market/features/profile/presentation/view/setting_view.dart';
import 'package:black_market/features/profile/presentation/view/widgets/bottom_sheets/log_out_modal_bottom_sheet.dart';
import 'package:black_market/features/profile/presentation/view/widgets/buttons/danger_zone_button.dart';
import 'package:black_market/features/profile/presentation/view/widgets/buttons/profile_item_container_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return (context.read<AppCubit>().userModel == null)
        ? Center(
            child: DefaultButton(
              onPressed: () {
                Navigator.push(
                  context,
                  SideSlideTransition(
                    page: const LogInView(),
                  ),
                );
              },
              width: 150.w,
              title: Tr.of(context).logIn,
            ),
          )
        : Column(
            children: [
              Container(
                height: 82.h,
                width: 82.w,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20.h, bottom: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: context.read<AppCubit>().userModel!.user.avatar,
                    errorWidget: (context, url, error) {
                      return Icon(
                        Icons.person_rounded,
                        size: 25.5.w,
                        color: AppColors.white,
                      );
                    },
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
              Text(
                context.read<AppCubit>().userModel!.user.name,
                style: TextStyles.textStyle16.copyWith(
                  color: AppColors.yellow,
                ),
              ),
              SizedBox(height: 28.h),
              ProfileItemContainerButton(
                icon: AppIcons.assetsIconsEditProfile,
                onTap: () {
                  Navigator.push(
                    context,
                    SideSlideTransition(
                      page: const EditProfileView(),
                    ),
                  );
                },
                title: Tr.of(context).editProfile,
              ),
              ProfileItemContainerButton(
                icon: AppIcons.assetsIconsWallet,
                onTap: () {},
                title: Tr.of(context).mySavings,
              ),
              ProfileItemContainerButton(
                icon: AppIcons.assetsIconsShareApp,
                onTap: () {},
                title: Tr.of(context).shareTheApp,
              ),
              ProfileItemContainerButton(
                icon: AppIcons.assetsIconsAbout,
                onTap: () {},
                title: Tr.of(context).aboutTheApp,
              ),
              ProfileItemContainerButton(
                icon: AppIcons.assetsIconsDollarCircle,
                onTap: () {
                  Navigator.push(
                    context,
                    SideSlideTransition(
                      page: const BaseCurrencyView(),
                    ),
                  );
                },
                title: Tr.of(context).baseCurrency,
              ),
              ProfileItemContainerButton(
                icon: AppIcons.assetsIconsSetting,
                onTap: () {
                  Navigator.push(
                    context,
                    SideSlideTransition(
                      page: const SettingView(),
                    ),
                  );
                },
                title: Tr.of(context).setting,
              ),
              SizedBox(height: 21.h),
              DangerZoneButton(
                icon: AppIcons.assetsIconsLogOut,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: AppColors.transparent,
                    builder: (context) {
                      return const LogOutModalBottomSheet();
                    },
                  );
                },
                title: Tr.of(context).logOut,
              ),
            ],
          );
  }
}
