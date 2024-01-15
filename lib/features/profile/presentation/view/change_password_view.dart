import 'package:black_market/core/presentation/view/app_bars/default_app_bar.dart';
import 'package:black_market/features/profile/presentation/view/widgets/change_password_view_body.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: const Scaffold(
        appBar: DefaultAppBar(title: 'تغيير كلمة المرور'),
        body: ChangePasswordViewBody(),
      ),
    );
  }
}
