import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/auth/presentation/view/widgets/log_in_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: AppColors.backgroundColor,
          ),
        ),
        body: const LogInViewBody(),
      ),
    );
  }
}
