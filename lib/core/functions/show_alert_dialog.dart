import 'package:flutter/material.dart';

void showAlertDialog(
  BuildContext context, {
  required Widget child,
  bool canDismiss = true,
}) {
  showDialog(
    context: context,
    barrierDismissible: canDismiss,
    builder: (context) => PopScope(
      canPop: canDismiss,
      child: child,
    ),
  );
}
