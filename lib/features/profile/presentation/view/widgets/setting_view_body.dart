import 'package:black_market/core/animations/left_slide_transition.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/features/profile/presentation/view/change_password_view.dart';
import 'package:black_market/features/profile/presentation/view/language_view.dart';
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
              RightSlideTransition(
                page: const ChangePasswordView(),
              ),
            );
          },
          title: 'تغيير كلمه المرور',
        ),
        ProfileItemContainerButton(
          icon: AppIcons.assetsIconsBank,
          onTap: () {},
          title: 'الترتيب المفضل للبنوك',
        ),
        ProfileItemContainerButton(
            icon: AppIcons.assetsIconsDollarCircle,
            onTap: () {},
            title: 'الترتيب المفضل للعملات'),
        ProfileItemContainerButton(
          icon: AppIcons.assetsIconsLanguage,
          onTap: () {
            Navigator.push(
              context,
              RightSlideTransition(
                page: const LanguageView(),
              ),
            );
          },
          title: 'اللغة',
        ),
        ProfileItemContainerButton(
          icon: AppIcons.assetsIconsNotificationBing,
          onTap: () {},
          title: 'اعدادات الاشعارات',
        ),
        SizedBox(height: 25.h),
        DangerZoneButton(
          icon: AppIcons.assetsIconsTrash,
          onPressed: () {},
          title: 'حذف الحساب',
        ),
      ],
    );
  }
}
