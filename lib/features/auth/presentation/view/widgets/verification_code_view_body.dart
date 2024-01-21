import 'package:black_market/core/animations/side_slide_transition.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/buttons/default_button.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/auth/presentation/view/reset_password_view.dart';
import 'package:black_market/features/auth/presentation/view/widgets/forms/otp_form.dart';
import 'package:black_market/features/auth/presentation/view/widgets/rows/resend_code_row.dart';
import 'package:black_market/features/auth/presentation/view_model/resend_verification_code_cubit/resend_veification_code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationCodeViewBody extends StatefulWidget {
  const VerificationCodeViewBody({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<VerificationCodeViewBody> createState() =>
      _VerificationCodeViewBodyState();
}

class _VerificationCodeViewBodyState extends State<VerificationCodeViewBody> {
  final ValueNotifier<AutovalidateMode> _autoValidateModeValueNotifier =
      ValueNotifier<AutovalidateMode>(AutovalidateMode.disabled);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ValueNotifier<String> _otpValueNotifier = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
    context.read<ResendVeificationCodeCubit>().email = widget.email;
  }

  @override
  void dispose() {
    _autoValidateModeValueNotifier.dispose();
    _otpValueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 60.h),
            Text(
              Tr.of(context).enterTheConfirmationCode,
              style: TextStyles.textStyle18,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 18.h),
            Text(
              Tr.of(context).weHaveSentTheConfirmationCodeTo,
              style: TextStyles.textStyle12.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.lightYellowHover,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            Text(
              widget.email,
              style: TextStyles.textStyle12.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.yellow,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),
            OtpForm(
              autoValidateModeValueNotifier: _autoValidateModeValueNotifier,
              formKey: _formKey,
              otpValueNotifier: _otpValueNotifier,
            ),
            SizedBox(height: 43.h),
            const ResendCodeRow(),
            SizedBox(height: 292.h),
            DefaultButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  //make otp empty before save new value
                  //to make sure that otp isn't overridding on an old value
                  _otpValueNotifier.value = '';
                  _formKey.currentState!.save();
                  Navigator.push(
                    context,
                    SideSlideTransition(
                      page: ResetPasswordView(
                        email: widget.email,
                        otp: _otpValueNotifier.value,
                      ),
                    ),
                  );
                } else {
                  _autoValidateModeValueNotifier.value =
                      AutovalidateMode.always;
                }
              },
              title: Tr.of(context).track,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
