import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/core/presentation/view/sections/user_data_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 72.h),
              Text(
                'تسجيل الدخول\nالى حسابك',
                style: TextStyles.textStyle26,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.h),
              const UserDataSection(
                hintText: 'أدخل البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                sectionTitle: 'البريد الإلكتروني',
                suffixIcon: AppIcons.assetsIconsMessage,
              ),
              SizedBox(height: 24.h),
              const UserDataSection(
                hintText: 'أدخل  كود المرور',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                sectionTitle: 'كلمة المرور',
                suffixIcon: AppIcons.assetsIconsLock,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
