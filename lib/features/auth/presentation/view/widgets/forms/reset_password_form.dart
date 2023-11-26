import 'package:black_market/core/presentation/view/sections/user_data_section.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/features/auth/presentation/view_model/update_password_cubit/update_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({
    super.key,
    required this.autoValidateModeValueNotifier,
    required this.formKey,
  });

  final ValueNotifier<AutovalidateMode> autoValidateModeValueNotifier;
  final GlobalKey<FormState> formKey;

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.autoValidateModeValueNotifier,
      builder: (context, autoValidateMode, child) => Form(
        key: widget.formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          children: [
            UserDataSection(
              controller: _passwordController,
              hintText: 'أدخل  كود المرور',
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onSaved: (newValue) {
                context.read<UpdatePasswordCubit>().password = newValue;
              },
              sectionTitle: 'كلمة المرور',
              suffixIcon: AppIcons.assetsIconsLock,
            ),
            SizedBox(height: 32.h),
            UserDataSection(
              hintText: 'أدخل  كود المرور',
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onSaved: (newValue) {
                context.read<UpdatePasswordCubit>().confirmedPassword =
                    newValue;
              },
              sectionTitle: 'تأكيد كلمة المرور',
              suffixIcon: AppIcons.assetsIconsLock,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'هذا الحقل مطلوب';
                } else if (value != _passwordController.text) {
                  return 'تأكد من تطابق كلمة المرور';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
