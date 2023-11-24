import 'package:black_market/core/animations/left_slide_transition.dart';
import 'package:black_market/core/presentation/view/buttons/default_button.dart';
import 'package:black_market/core/presentation/view/sections/user_data_section.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/features/auth/presentation/view/verification_code_view.dart';
import 'package:black_market/features/auth/presentation/view/widgets/containers/forget_password_warning_message_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 60.h),
            const ForgetPasswordWarningMessageContainer(),
            SizedBox(height: 32.h),
            const UserDataSection(
              hintText: 'أدخل البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              sectionTitle: 'البريد الإلكتروني',
              suffixIcon: AppIcons.assetsIconsMessage,
            ),
            SizedBox(height: 342.h),
            DefaultButton(
              onPressed: () {
                Navigator.push(
                  context,
                  RightSlideTransition(
                    page: const VerificationCodeView(),
                  ),
                );
              },
              title: 'متابعة',
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
