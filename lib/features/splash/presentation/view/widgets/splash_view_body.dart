import 'package:black_market/core/animations/fade_transition_animation.dart';
import 'package:black_market/core/presentation/view_model/localization_cubit/localization_cubit.dart';
import 'package:black_market/core/utils/app_images.dart';
import 'package:black_market/features/navbar/presentation/view/nav_bar_view.dart';
import 'package:black_market/features/splash/presentation/view_model/set_up_app_data_cubit/set_up_app_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        const Duration(seconds: 4),
        () async {
          await context.read<LocalizationCubit>().setUpAppLanguage();
          if (!context.mounted) return;
          context.read<SetUpAppDataCubit>().setUpUserData();
        },
      ),
      builder: (context, snapshot) =>
          BlocListener<SetUpAppDataCubit, SetUpAppDataState>(
        listener: (context, state) {
          if (state is SetUpAppDataSuccess) {
            Navigator.pushReplacement(
              context,
              FadeTransitionAnimation(
                page: const NavBarView(),
              ),
            );
          }
        },
        child: Center(
          child: Image.asset(
            AppImages.assetsImagesLogoPng,
            height: 279.h,
            width: 279.w,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
