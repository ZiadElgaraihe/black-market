import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/app_bars/default_app_bar.dart';
import 'package:black_market/core/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:black_market/core/utils/service_locator.dart';
import 'package:black_market/features/auth/data/repos/auth_repo.dart';
import 'package:black_market/features/auth/presentation/view/widgets/reset_password_view_body.dart';
import 'package:black_market/features/auth/presentation/view_model/update_password_cubit/update_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({
    super.key,
    required this.email,
    required this.otp,
  });

  final String email;
  final String otp;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpdatePasswordCubit>(
      create: (context) => UpdatePasswordCubit(
        appCubit: context.read<AppCubit>(),
        authServices: getIt<AuthServices>(),
        connectionServices: getIt<ConnectionServices>(),
      ),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: Scaffold(
          appBar: DefaultAppBar(title: Tr.of(context).createNewPassword),
          body: ResetPasswordViewBody(
            email: email,
            otp: otp,
          ),
        ),
      ),
    );
  }
}
