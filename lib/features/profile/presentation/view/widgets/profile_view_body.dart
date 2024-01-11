import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/profile/presentation/view/widgets/buttons/danger_zone_button.dart';
import 'package:black_market/features/profile/presentation/view/widgets/buttons/profile_item_container_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 82.h,
          width: 82.w,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 10.h, bottom: 8.h),
          decoration: BoxDecoration(
            color: AppColors.yellow,
            shape: BoxShape.circle,
          ),
          child: Text(
            'ع',
            style: TextStyles.textStyle22.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
        Text(
          'علي عبدالله',
          style: TextStyles.textStyle16.copyWith(
            color: AppColors.yellow,
          ),
        ),
        SizedBox(height: 28.h),
        ProfileItemContainerButton(
          icon: AppIcons.assetsIconsProfile,
          onTap: () {},
          title: 'تعديل الملف الشخصي',
        ),
        ProfileItemContainerButton(
          icon: AppIcons.assetsIconsWallet,
          onTap: () {},
          title: 'مدخراتي',
        ),
        ProfileItemContainerButton(
          icon: AppIcons.assetsIconsShareApp,
          onTap: () {},
          title: 'مشاركة التطبيق',
        ),
        ProfileItemContainerButton(
          icon: AppIcons.assetsIconsAbout,
          onTap: () {},
          title: 'عن التطبيق',
        ),
        ProfileItemContainerButton(
          icon: AppIcons.assetsIconsDollarCircle,
          onTap: () {},
          title: 'العملة الاساسية',
        ),
        ProfileItemContainerButton(
          icon: AppIcons.assetsIconsSetting,
          onTap: () {},
          title: 'الاعدادات',
        ),
        SizedBox(height: 20.h),
        DangerZoneButton(
          icon: AppIcons.assetsIconsLogOut,
          onPressed: () {},
          title: 'تسجيل الخروج',
        ),
      ],
    );
  }
}
