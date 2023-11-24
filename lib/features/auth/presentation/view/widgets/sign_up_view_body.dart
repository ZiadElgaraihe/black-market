import 'package:black_market/core/animations/bottom_slide_transition.dart';
import 'package:black_market/core/presentation/view/buttons/default_button.dart';
import 'package:black_market/core/presentation/view/sections/user_data_section.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/features/auth/presentation/view/success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 64.h),
            const UserDataSection(
              hintText: 'أدخل الاسم بالكامل',
              keyboardType: TextInputType.name,
              obscureText: false,
              sectionTitle: 'الاسم بالكامل',
              suffixIcon: AppIcons.assetsIconsProfile,
            ),
            SizedBox(height: 26.h),
            const UserDataSection(
              hintText: 'أدخل البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              sectionTitle: 'البريد الإلكتروني',
              suffixIcon: AppIcons.assetsIconsMessage,
            ),
            SizedBox(height: 26.h),
            const UserDataSection(
              hintText: 'أدخل  كود المرور',
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              sectionTitle: 'كلمة المرور',
              suffixIcon: AppIcons.assetsIconsLock,
            ),
            SizedBox(height: 26.h),
            const UserDataSection(
              hintText: 'أدخل  كود المرور',
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              sectionTitle: 'تأكيد كلمة المرور',
              suffixIcon: AppIcons.assetsIconsLock,
            ),
            SizedBox(height: 120.h),
            DefaultButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  BottomSlideTransition(
                    page: const SuccessView(title: 'تم إنشاء الحساب بنجاح'),
                  ),
                  (route) => false,
                );
              },
              title: 'التالي',
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
