import 'package:black_market/features/auth/presentation/view/widgets/rows/otp_row.dart';
import 'package:flutter/material.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({
    super.key,
    required this.autoValidateModeValueNotifier,
    required this.formKey,
  });

  final ValueNotifier<AutovalidateMode> autoValidateModeValueNotifier;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: autoValidateModeValueNotifier,
      builder: (context, autovalidateMode, child) => Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: const OtpRow(),
      ),
    );
  }
}
