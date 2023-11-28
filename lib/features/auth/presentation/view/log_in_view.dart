import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/data/services/local_database_services.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/service_locator.dart';
import 'package:black_market/features/auth/data/services/auth_services.dart';
import 'package:black_market/features/auth/presentation/view/widgets/log_in_view_body.dart';
import 'package:black_market/features/auth/presentation/view_model/log_in_cubit/log_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogInCubit>(
      create: (context) => LogInCubit(
        authServices: getIt<AuthServices>(),
        connectionServices: getIt<ConnectionServices>(),
        localDatabaseServices: getIt<LocalDatabaseServices>(),
      ),
      child: GestureDetector(
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
      ),
    );
  }
}
