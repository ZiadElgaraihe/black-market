import 'package:black_market/core/presentation/view/buttons/default_button.dart';
import 'package:black_market/core/presentation/view/sections/user_data_section.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/auth/presentation/view/widgets/buttons/continue_with_google_button.dart';
import 'package:black_market/features/auth/presentation/view/widgets/buttons/log_in_text_button.dart';
import 'package:black_market/features/auth/presentation/view/widgets/rows/no_account_row.dart';
import 'package:black_market/features/auth/presentation/view/widgets/rows/or_divider_row.dart';
import 'package:black_market/features/auth/presentation/view/widgets/rows/remember_me_row.dart';
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
              SizedBox(height: 18.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const RememberMeRow(),
                  LogInTextButton(
                    onPressed: () {},
                    title: 'هل نسيت كلمة المرور ؟',
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              DefaultButton(
                onPressed: () {},
                title: 'تسجيل الدخول',
              ),
              SizedBox(height: 20.h),
              const NoAccountRow(),
              const OrDividerRow(),
              const ContinueWithGoogleButton(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
