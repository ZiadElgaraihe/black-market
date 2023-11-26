import 'package:black_market/core/presentation/view/sections/user_data_section.dart';
import 'package:black_market/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({
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
      builder: (context, autovalidateMode, child) => Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: const UserDataSection(
          hintText: 'أدخل البريد الإلكتروني',
          keyboardType: TextInputType.emailAddress,
          obscureText: false,
          sectionTitle: 'البريد الإلكتروني',
          suffixIcon: AppIcons.assetsIconsMessage,
        ),
      ),
    );
  }
}
