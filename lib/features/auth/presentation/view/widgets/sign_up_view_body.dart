import 'package:black_market/features/auth/presentation/view/widgets/blocs/sign_up_bloc_consumer.dart';
import 'package:black_market/features/auth/presentation/view/widgets/forms/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
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
            SizedBox(height: 64.h),
            SignUpForm(
              formKey: _formKey,
              autoValidateModeValueNotifier: _autoValidateModeValueNotifier,
            ),
            SizedBox(height: 120.h),
            SignUpBlocConsumer(
              formKey: _formKey,
              autoValidateModeValueNotifier: _autoValidateModeValueNotifier,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
