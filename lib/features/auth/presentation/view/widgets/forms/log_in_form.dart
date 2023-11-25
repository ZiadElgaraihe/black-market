import 'package:black_market/core/presentation/view/sections/user_data_section.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/features/auth/presentation/view_model/log_in_cubit/log_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInForm extends StatelessWidget {
  const LogInForm({
    super.key,
    required this.autoValidateModeValueNotifier,
    required this.formKey,
  });

  final ValueNotifier<AutovalidateMode> autoValidateModeValueNotifier;

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: autoValidateModeValueNotifier,
      builder: (context, autoValidateMode, child) => Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          children: [
            UserDataSection(
              hintText: 'أدخل البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              onSaved: (newValue) {
                context.read<LogInCubit>().email = newValue;
              },
              sectionTitle: 'البريد الإلكتروني',
              suffixIcon: AppIcons.assetsIconsMessage,
            ),
            SizedBox(height: 24.h),
            UserDataSection(
              hintText: 'أدخل  كود المرور',
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onSaved: (newValue) {
                context.read<LogInCubit>().password = newValue;
              },
              sectionTitle: 'كلمة المرور',
              suffixIcon: AppIcons.assetsIconsLock,
            ),
          ],
        ),
      ),
    );
  }
}
