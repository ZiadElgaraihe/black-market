import 'package:black_market/core/animations/left_slide_transition.dart';
import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/presentation/view/alert_dialogs/result_alert_dialog.dart';
import 'package:black_market/core/presentation/view/buttons/default_button.dart';
import 'package:black_market/core/presentation/view/buttons/default_loading_button.dart';
import 'package:black_market/features/auth/presentation/view/verification_code_view.dart';
import 'package:black_market/features/auth/presentation/view_model/forget_password_cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordBlocConsumer extends StatelessWidget {
  const ForgetPasswordBlocConsumer({
    super.key,
    required this.autoValidateModeValueNotifier,
    required this.formKey,
  });

  final ValueNotifier<AutovalidateMode> autoValidateModeValueNotifier;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: _listener,
      builder: (context, state) {
        if (state is ForgetPasswordLoading) {
          return const DefaultLoadingButton();
        } else {
          return DefaultButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                context.read<ForgetPasswordCubit>().forgetPassword();
              } else {
                autoValidateModeValueNotifier.value = AutovalidateMode.always;
              }
            },
            title: 'متابعة',
          );
        }
      },
    );
  }

  void _listener(context, state) {
    if (state is ForgetPasswordSuccess) {
      Navigator.push(
        context,
        RightSlideTransition(
          page: const VerificationCodeView(),
        ),
      );
    } else if (state is ForgetPasswordFailure) {
      showAlertDialog(
        context,
        child: ResultAlertDialog(
          buttonTitle: 'عودة',
          message: state.errMessage,
          onPressed: () {
            Navigator.pop(context);
          },
          title: 'فشل',
        ),
      );
    }
  }
}
