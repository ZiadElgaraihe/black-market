import 'package:black_market/core/animations/fade_transition_animation.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/auth/presentation/view/log_in_view.dart';
import 'package:black_market/features/splash/presentation/view/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        const Duration(seconds: 4),
        () {
          Navigator.pushReplacement(
            context,
            FadeTransitionAnimation(
              page: const LogInView(),
            ),
          );
        },
      ),
      builder: (context, snapshot) => Scaffold(
        backgroundColor: AppColors.yellow,
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: AppColors.yellow,
          ),
        ),
        body: const SplashViewBody(),
      ),
    );
  }
}
