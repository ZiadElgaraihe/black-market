import 'package:black_market/features/auth/presentation/view/widgets/blocs/reset_password_bloc_consumer.dart';
import 'package:black_market/features/auth/presentation/view/widgets/forms/reset_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  final ValueNotifier<AutovalidateMode> _autoValidateModeValueNotifier =
      ValueNotifier<AutovalidateMode>(AutovalidateMode.disabled);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _autoValidateModeValueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 60.h),
            ResetPasswordForm(
              autoValidateModeValueNotifier: _autoValidateModeValueNotifier,
              formKey: _formKey,
            ),
            SizedBox(height: 342.h),
            ResetPasswordBlocConsumer(
              autoValidateModeValueNotifier: _autoValidateModeValueNotifier,
              formKey: _formKey,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
