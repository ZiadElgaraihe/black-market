import 'package:black_market/core/presentation/view/app_bars/default_app_bar.dart';
import 'package:black_market/core/utils/service_locator.dart';
import 'package:black_market/features/auth/data/services/auth_services.dart';
import 'package:black_market/features/auth/presentation/view/widgets/sign_up_view_body.dart';
import 'package:black_market/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => SignUpCubit(authServices: getIt<AuthServices>()),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: const Scaffold(
          appBar: DefaultAppBar(title: 'إنشاء حساب جديد'),
          body: SignUpViewBody(),
        ),
      ),
    );
  }
}
