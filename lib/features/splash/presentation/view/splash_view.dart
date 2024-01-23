import 'package:black_market/core/data/services/local_database_services.dart';
import 'package:black_market/core/data/services/secure_database_services.dart';
import 'package:black_market/core/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/service_locator.dart';
import 'package:black_market/features/splash/presentation/view/widgets/splash_view_body.dart';
import 'package:black_market/features/splash/presentation/view_model/set_up_app_data_cubit/set_up_app_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SetUpAppDataCubit>(
      create: (context) => SetUpAppDataCubit(
        appCubit: context.read<AppCubit>(),
        localDatabaseServices: getIt<LocalDatabaseServices>(),
        secureDatabaseServices: getIt<SecureDatabaseServices>(),
      ),
      child: Scaffold(
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
