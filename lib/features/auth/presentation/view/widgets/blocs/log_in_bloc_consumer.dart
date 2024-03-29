import 'package:black_market/core/animations/bottom_slide_transition.dart';
import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/alert_dialogs/result_alert_dialog.dart';
import 'package:black_market/core/presentation/view/buttons/default_button.dart';
import 'package:black_market/core/presentation/view/buttons/default_loading_button.dart';
import 'package:black_market/features/auth/presentation/view_model/log_in_cubit/log_in_cubit.dart';
import 'package:black_market/features/navbar/presentation/view/nav_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInBlocConsumer extends StatelessWidget {
  const LogInBlocConsumer({
    super.key,
    required this.autoValidateModeValueNotifier,
    required this.formKey,
  });

  final ValueNotifier<AutovalidateMode> autoValidateModeValueNotifier;

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInCubit, LogInState>(
      listener: _listener,
      builder: (context, state) {
        if (state is LogInLoading) {
          return const DefaultLoadingButton();
        } else {
          return DefaultButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                context.read<LogInCubit>().logIn();
              } else {
                autoValidateModeValueNotifier.value = AutovalidateMode.always;
              }
            },
            title: Tr.of(context).logIn,
          );
        }
      },
    );
  }

  void _listener(context, state) {
    if (state is LogInSuccess) {
      Navigator.pushAndRemoveUntil(
        context,
        BottomSlideTransition(
          page: const NavBarView(),
        ),
        (route) => false,
      );
    } else if (state is LogInFailure) {
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
