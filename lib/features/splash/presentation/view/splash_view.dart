import 'package:black_market/core/animations/fade_transition_animation.dart';
import 'package:black_market/core/presentation/view_model/localization_cubit/localization_cubit.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/navbar/presentation/view/nav_bar_view.dart';
import 'package:black_market/features/splash/presentation/view/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        const Duration(seconds: 4),
        () async {
          await context.read<LocalizationCubit>().setUpAppLanguage();
          if (!context.mounted) return;
          Navigator.pushReplacement(
            context,
            FadeTransitionAnimation(
              page: const NavBarView(),
            ),
          );
        },
      ),
      builder: (context, snapshot) => Scaffold(
        backgroundColor: AppColors.yellow,
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          backgroundColor: AppColors.transparent,
        ),
        body: const SplashViewBody(),
      ),
    );
  }
}
