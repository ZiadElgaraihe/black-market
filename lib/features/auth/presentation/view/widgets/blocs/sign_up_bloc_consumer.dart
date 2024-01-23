import 'package:black_market/core/animations/bottom_slide_transition.dart';
import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/alert_dialogs/result_alert_dialog.dart';
import 'package:black_market/core/presentation/view/buttons/default_button.dart';
import 'package:black_market/core/presentation/view/buttons/default_loading_button.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/auth/presentation/view/success_view.dart';
import 'package:black_market/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocConsumer extends StatelessWidget {
  const SignUpBlocConsumer({
    super.key,
    required this.autoValidateModeValueNotifier,
    required this.formKey,
  });

  final ValueNotifier<AutovalidateMode> autoValidateModeValueNotifier;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: _listener,
      builder: (context, state) {
        if (state is SignUpLoading) {
          return const DefaultLoadingButton();
        } else {
          return DefaultButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                context.read<SignUpCubit>().signUp();
              } else {
                autoValidateModeValueNotifier.value = AutovalidateMode.always;
              }
            },
            title: Tr.of(context).next,
          );
        }
      },
    );
  }

  void _listener(context, state) {
    if (state is SignUpLoading) {
      showAlertDialog(
        context,
        canDismiss: false,
        barrierColor: AppColors.transparent,
        child: const AlertDialog(),
      );
    } else if (state is SignUpSuccess) {
      Navigator.pushAndRemoveUntil(
        context,
        BottomSlideTransition(
          page: SuccessView(
            title: Tr.of(context).accountCreatedSuccessfully,
          ),
        ),
        (route) => false,
      );
    } else if (state is SignUpFailure) {
      Navigator.pop(context);
      showAlertDialog(
        context,
        child: ResultAlertDialog(
          buttonTitle: Tr.of(context).cancel,
          message: state.errMessage,
          onPressed: () {
            Navigator.pop(context);
          },
          title: Tr.of(context).failure,
        ),
      );
    }
  }
}
