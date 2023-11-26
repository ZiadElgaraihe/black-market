import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/auth/presentation/view/widgets/blocs/resend_password_bloc_consumer.dart';
import 'package:flutter/material.dart';

class ResendCodeRow extends StatelessWidget {
  const ResendCodeRow({super.key});

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
        const ResendPasswordBlocConsumer(),
      ],
    );
  }
}
