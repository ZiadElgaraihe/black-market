import 'package:flutter/material.dart';

void showAlertDialog(
  BuildContext context, {
  required Widget child,
  bool canDismiss = true,
}) {
  showDialog(
    context: context,
    barrierDismissible: canDismiss,
    builder: (context) => WillPopScope(
      onWillPop: () async => canDismiss,
      child: child,
    ),
  );
}
