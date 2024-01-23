import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/app_bars/default_app_bar.dart';
import 'package:black_market/core/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:black_market/core/utils/service_locator.dart';
import 'package:black_market/features/auth/data/repos/auth_repo.dart';
import 'package:black_market/features/auth/presentation/view/widgets/sign_up_view_body.dart';
import 'package:black_market/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => SignUpCubit(
        appCubit: context.read<AppCubit>(),
        authServices: getIt<AuthServices>(),
        connectionServices: getIt<ConnectionServices>(),
      ),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: Scaffold(
          appBar: DefaultAppBar(title: Tr.of(context).signUp),
          body: const SignUpViewBody(),
        ),
      ),
    );
  }
}
