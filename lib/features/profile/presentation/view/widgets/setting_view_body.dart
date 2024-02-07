import 'package:black_market/core/animations/side_slide_transition.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/features/profile/presentation/view/change_password_view.dart';
import 'package:black_market/features/profile/presentation/view/language_view.dart';
import 'package:black_market/features/profile/presentation/view/notifications_setting_view.dart';
import 'package:black_market/features/profile/presentation/view/widgets/buttons/danger_zone_button.dart';
import 'package:black_market/features/profile/presentation/view/widgets/buttons/profile_item_container_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.h),
        ProfileItemContainerButton(
          icon: AppIcons.assetsIconsChangePassword,
          onTap: () {
            Navigator.push(
              context,
              SideSlideTransition(
                page: const ChangePasswordView(),
              ),
            );
          },
          title: Tr.of(context).changePassword,
        ),
        ProfileItemContainerButton(
          icon: AppIcons.assetsIconsLanguage,
          onTap: () {
            Navigator.push(
              context,
              SideSlideTransition(
                page: const LanguageView(),
              ),
            );
          },
          title: Tr.of(context).language,
        ),
        ProfileItemContainerButton(
          icon: AppIcons.assetsIconsNotificationBing,
          onTap: () {
            Navigator.push(
              context,
              SideSlideTransition(
                page: const NotificationsSettingView(),
              ),
            );
          },
          title: Tr.of(context).notificationsSetting,
        ),
        SizedBox(height: 25.h),
        DangerZoneButton(
          icon: AppIcons.assetsIconsTrash,
          onPressed: () {},
          title: Tr.of(context).deleteAccount,
        ),
      ],
    );
  }
}
