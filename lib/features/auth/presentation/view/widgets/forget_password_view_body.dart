import 'package:black_market/features/auth/presentation/view/widgets/blocs/forget_password_bloc_consumer.dart';
import 'package:black_market/features/auth/presentation/view/widgets/containers/forget_password_warning_message_container.dart';
import 'package:black_market/features/auth/presentation/view/widgets/forms/forget_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
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
            const ForgetPasswordWarningMessageContainer(),
            SizedBox(height: 32.h),
            ForgetPasswordForm(
              autoValidateModeValueNotifier: _autoValidateModeValueNotifier,
              formKey: _formKey,
            ),
            SizedBox(height: 342.h),
            ForgetPasswordBlocConsumer(
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
