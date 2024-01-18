import 'package:black_market/core/presentation/view_model/localization_cubit/localization_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideSlideTransition extends PageRouteBuilder {
  final Widget page;
  SideSlideTransition({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            Offset begin = Offset(
              context.read<LocalizationCubit>().isArabic() ? 1 : -1,
              0,
            );
            Offset end = const Offset(0, 0);
            Tween<Offset> tween = Tween<Offset>(begin: begin, end: end);
            CurvedAnimation curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.decelerate,
            );
            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: child,
            );
          },
        );
}
