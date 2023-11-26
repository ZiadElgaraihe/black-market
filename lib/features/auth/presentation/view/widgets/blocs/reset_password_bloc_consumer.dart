import 'package:black_market/core/animations/bottom_slide_transition.dart';
import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/presentation/view/alert_dialogs/result_alert_dialog.dart';
import 'package:black_market/core/presentation/view/buttons/default_button.dart';
import 'package:black_market/core/presentation/view/buttons/default_loading_button.dart';
import 'package:black_market/features/auth/presentation/view/success_view.dart';
import 'package:black_market/features/auth/presentation/view_model/update_password_cubit/update_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordBlocConsumer extends StatelessWidget {
  const ResetPasswordBlocConsumer({
    super.key,
    required this.autoValidateModeValueNotifier,
    required this.formKey,
  });

  final ValueNotifier<AutovalidateMode> autoValidateModeValueNotifier;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
      listener: _listener,
      builder: (context, state) {
        if (state is UpdatePasswordLoading) {
          return const DefaultLoadingButton();
        } else {
          return DefaultButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                context.read<UpdatePasswordCubit>().updatePassword();
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
    if (state is UpdatePasswordSuccess) {
      Navigator.pushAndRemoveUntil(
        context,
        BottomSlideTransition(
          page: SuccessView(
            buttonTitle: 'الرئيسية',
            onPressed: () {},
            title: 'تم إنشاء كلمة مرور جديدة بنجاح',
          ),
        ),
        (route) => false,
      );
    } else if (state is UpdatePasswordFailure) {
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
