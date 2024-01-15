import 'package:black_market/core/presentation/view/buttons/default_button.dart';
import 'package:black_market/core/presentation/view/sections/user_data_section.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/features/profile/presentation/view/widgets/bottom_sheets/change_password_success_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 24.h),
          const UserDataSection(
            hintText: 'أدخل  كود المرور',
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            sectionTitle: 'كلمة المرور الحالية',
            suffixIcon: AppIcons.assetsIconsLock,
          ),
          SizedBox(height: 32.h),
          const UserDataSection(
            hintText: 'أدخل  كود المرور',
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            sectionTitle: 'كلمة المرور الجديدة',
            suffixIcon: AppIcons.assetsIconsLock,
          ),
          SizedBox(height: 32.h),
          const UserDataSection(
            hintText: 'أدخل  كود المرور',
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            sectionTitle: 'تاكيد كلمة المرور الجديدة',
            suffixIcon: AppIcons.assetsIconsLock,
          ),
          SizedBox(height: 266.h),
          DefaultButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.transparent,
                builder: (context) {
                  return const ChangePasswordSuccessModalBottomSheet();
                },
              );
            },
            title: 'تغيير',
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
