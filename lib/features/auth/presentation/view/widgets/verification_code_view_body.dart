import 'package:black_market/core/presentation/view/buttons/default_button.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/auth/presentation/view/widgets/rows/otp_row.dart';
import 'package:black_market/features/auth/presentation/view/widgets/rows/resend_code_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationCodeViewBody extends StatelessWidget {
  const VerificationCodeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 60.h),
            Text(
              'قم بإدخال الكود المرسل',
              style: TextStyles.textStyle18,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 18.h),
            Text(
              'لقد قمنا بإرسال رمز التأكيد الى',
              style: TextStyles.textStyle12.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.lightYellowHover,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            Text(
              'aliatwan@gmail.com',
              style: TextStyles.textStyle12.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.yellow,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),
            const OtpRow(),
            SizedBox(height: 43.h),
            const ResendCodeRow(),
            SizedBox(height: 292.h),
            DefaultButton(
              onPressed: () {},
              title: 'متابعة',
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
