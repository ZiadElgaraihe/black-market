import 'dart:async';

import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/alert_dialogs/result_alert_dialog.dart';
import 'package:black_market/core/presentation/view/snack_bars/message_snack_bar.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/auth/presentation/view_model/resend_verification_code_cubit/resend_veification_code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResendPasswordBlocConsumer extends StatefulWidget {
  const ResendPasswordBlocConsumer({super.key});

  @override
  State<ResendPasswordBlocConsumer> createState() =>
      _ResendPasswordBlocConsumerState();
}

class _ResendPasswordBlocConsumerState
    extends State<ResendPasswordBlocConsumer> {
  late Timer _timer;
  final ValueNotifier<int> _remainingSeconds = ValueNotifier<int>(60);

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _remainingSeconds.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResendVeificationCodeCubit, ResendVeificationCodeState>(
      listener: _listener,
      builder: (context, state) {
        if (state is ResendVeificationCodeLoading) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: CircularProgressIndicator(
              color: AppColors.yellow,
            ),
          );
        } else {
          return ValueListenableBuilder(
            valueListenable: _remainingSeconds,
            builder: (context, remainingSeconds, child) => TextButton(
              onPressed: (remainingSeconds == 0)
                  ? () {
                      context
                          .read<ResendVeificationCodeCubit>()
                          .resendVerificationCode();
                    }
                  : null,
              style: ButtonStyle(
                overlayColor: MaterialStatePropertyAll(
                  AppColors.lightYellowActive.withOpacity(0.1),
                ),
              ),
              child: Text(
                '${Tr.of(context).resend} ${(remainingSeconds != 0) ? '($remainingSeconds ${Tr.of(context).second})' : ''}',
                style: TextStyles.textStyle14.copyWith(
                  color: AppColors.yellow,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  void _listener(context, state) {
    if (state is ResendVeificationCodeSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        messageSnackBar(message: Tr.of(context).verificationCodeHasBeenResent),
      );
      _remainingSeconds.value = 60;
      _startTimer();
    } else if (state is ResendVeificationCodeFailure) {
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

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_remainingSeconds.value > 0) {
          _remainingSeconds.value--;
        } else {
          timer.cancel();
        }
      },
    );
  }
}
