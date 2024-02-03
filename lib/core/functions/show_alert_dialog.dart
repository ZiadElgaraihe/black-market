import 'package:flutter/material.dart';

void showAlertDialog(
  BuildContext context, {
  required Widget child,
  bool canDismiss = true,
  Color? barrierColor,
  void Function(bool didPop)? onPopInvoked,
}) {
  showDialog(
    context: context,
    barrierColor: barrierColor,
    barrierDismissible: canDismiss,
    builder: (context) => PopScope(
      onPopInvoked: onPopInvoked,
      canPop: canDismiss,
      child: child,
    ),
  );
}
