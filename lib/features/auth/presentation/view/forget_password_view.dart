import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/app_bars/default_app_bar.dart';
import 'package:black_market/core/utils/service_locator.dart';
import 'package:black_market/features/auth/data/services/auth_services.dart';
import 'package:black_market/features/auth/presentation/view/widgets/forget_password_view_body.dart';
import 'package:black_market/features/auth/presentation/view_model/forget_password_cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPasswordCubit>(
      create: (context) => ForgetPasswordCubit(
        authServices: getIt<AuthServices>(),
        connectionServices: getIt<ConnectionServices>(),
      ),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: Scaffold(
          appBar: DefaultAppBar(title: Tr.of(context).passwordRecovery),
          body: const ForgetPasswordViewBody(),
        ),
      ),
    );
  }
}
