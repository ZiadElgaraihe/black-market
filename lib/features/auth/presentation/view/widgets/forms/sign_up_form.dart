import 'package:black_market/core/presentation/view/sections/user_data_section.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:black_market/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
    required this.autoValidateModeValueNotifier,
    required this.formKey,
  });

  final ValueNotifier<AutovalidateMode> autoValidateModeValueNotifier;
  final GlobalKey<FormState> formKey;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
              hintText: 'أدخل الاسم بالكامل',
              keyboardType: TextInputType.name,
              obscureText: false,
              onSaved: (newValue) {
                context.read<SignUpCubit>().fullName = newValue;
              },
              sectionTitle: 'الاسم بالكامل',
              suffixIcon: AppIcons.assetsIconsProfile,
            ),
            SizedBox(height: 26.h),
            UserDataSection(
              hintText: 'أدخل البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              onSaved: (newValue) {
                context.read<SignUpCubit>().email = newValue;
              },
              sectionTitle: 'البريد الإلكتروني',
              suffixIcon: AppIcons.assetsIconsMessage,
            ),
            SizedBox(height: 26.h),
            UserDataSection(
              controller: _passwordController,
              hintText: 'أدخل  كود المرور',
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onSaved: (newValue) {
                context.read<SignUpCubit>().password = newValue;
              },
              sectionTitle: 'كلمة المرور',
              suffixIcon: AppIcons.assetsIconsLock,
            ),
            SizedBox(height: 26.h),
            UserDataSection(
              hintText: 'أدخل  كود المرور',
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onSaved: (newValue) {
                context.read<SignUpCubit>().confirmedPassword = newValue;
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
