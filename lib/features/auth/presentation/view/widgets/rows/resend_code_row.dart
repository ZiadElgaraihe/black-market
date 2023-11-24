import 'dart:async';

import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class ResendCodeRow extends StatefulWidget {
  const ResendCodeRow({super.key});

  @override
  State<ResendCodeRow> createState() => _ResendCodeRowState();
}

class _ResendCodeRowState extends State<ResendCodeRow> {
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'لم تتلق الرمز. ',
          style: TextStyles.textStyle14.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.lightGrey,
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _remainingSeconds,
          builder: (context, remainingSeconds, child) => TextButton(
            onPressed: (remainingSeconds == 0)
                ? () {
                    _remainingSeconds.value = 60;
                    _startTimer();
                  }
                : null,
            style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(
                AppColors.lightYellowActive.withOpacity(0.1),
              ),
            ),
            child: Text(
              'إعادة الإرسال ${(remainingSeconds != 0) ? '($remainingSeconds ثانية)' : ''}',
              style: TextStyles.textStyle14.copyWith(
                color: AppColors.yellow,
              ),
            ),
          ),
        ),
      ],
    );
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
