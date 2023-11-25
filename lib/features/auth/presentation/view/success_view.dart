import 'package:black_market/features/auth/presentation/view/widgets/success_view_body.dart';
import 'package:flutter/material.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({
    super.key,
    required this.buttonTitle,
    required this.onPressed,
    required this.title,
  });

  final String buttonTitle;
  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SuccessViewBody(
        buttonTitle: buttonTitle,
        onPressed: onPressed,
        title: title,
      ),
    );
  }
}
