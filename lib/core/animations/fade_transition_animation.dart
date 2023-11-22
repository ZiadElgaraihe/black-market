import 'package:flutter/material.dart';

class FadeTransitionAnimation extends PageRouteBuilder {
  final Widget page;
  FadeTransitionAnimation({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
