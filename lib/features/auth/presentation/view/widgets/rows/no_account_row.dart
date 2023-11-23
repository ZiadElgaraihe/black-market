import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/auth/presentation/view/widgets/buttons/log_in_text_button.dart';
import 'package:flutter/material.dart';

class NoAccountRow extends StatelessWidget {
  const NoAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'لا تمتلك حساب؟ ',
          style: TextStyles.textStyle12.copyWith(
            color: AppColors.grey,
          ),
        ),
        LogInTextButton(
          onPressed: () {},
          title: 'إنشاء حساب',
        ),
      ],
    );
  }
}
