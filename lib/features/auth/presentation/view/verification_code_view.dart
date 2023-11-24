import 'package:black_market/core/presentation/view/app_bars/default_app_bar.dart';
import 'package:black_market/features/auth/presentation/view/widgets/verification_code_view_body.dart';
import 'package:flutter/material.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: const Scaffold(
        appBar: DefaultAppBar(title: 'إسترجاع كلمة المرور'),
        body: VerificationCodeViewBody(),
      ),
    );
  }
}
