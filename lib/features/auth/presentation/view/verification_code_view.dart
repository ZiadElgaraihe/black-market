import 'package:black_market/core/presentation/view/app_bars/default_app_bar.dart';
import 'package:black_market/core/utils/service_locator.dart';
import 'package:black_market/features/auth/data/services/auth_services.dart';
import 'package:black_market/features/auth/presentation/view/widgets/verification_code_view_body.dart';
import 'package:black_market/features/auth/presentation/view_model/resend_verification_code_cubit/resend_veification_code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResendVeificationCodeCubit>(
      create: (context) => ResendVeificationCodeCubit(
        authServices: getIt<AuthServices>(),
      ),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: Scaffold(
          appBar: const DefaultAppBar(title: 'إسترجاع كلمة المرور'),
          body: VerificationCodeViewBody(email: email),
        ),
      ),
    );
  }
}
