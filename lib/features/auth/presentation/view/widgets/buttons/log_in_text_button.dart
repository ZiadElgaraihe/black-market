import 'package:black_market/core/functions/future_delayd_navigator.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class LogInTextButton extends StatelessWidget {
  const LogInTextButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        futureDelayedNavigator(() {
          onPressed();
        });
      },
      style: ButtonStyle(
        overlayColor: MaterialStatePropertyAll(
          AppColors.lightYellow.withOpacity(0.1),
        ),
      ),
      child: Text(
        title,
        style: TextStyles.textStyle12.copyWith(
          color: AppColors.lightYellow,
        ),
      ),
    );
  }
}
