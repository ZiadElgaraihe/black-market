import 'package:flutter/material.dart';

void showAlertDialog(
  BuildContext context, {
  required Widget child,
  bool canDismiss = true,
  Color? barrierColor,
}) {
  showDialog(
    context: context,
    barrierColor: barrierColor,
    barrierDismissible: canDismiss,
    builder: (context) => PopScope(
      canPop: canDismiss,
      child: child,
    ),
  );
}
