import 'package:black_market/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HeaderBackgroundContainer extends StatelessWidget {
  const HeaderBackgroundContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurrencyHeaderCustomClipper(),
      child: Container(
        width: double.infinity,
        color: AppColors.darkGrey,
      ),
    );
  }
}

class CurrencyHeaderCustomClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    Path path = Path();
    path.moveTo(0, 0);

    path.lineTo(width, 0);

    path.lineTo(width, height * 0.8);

    path.quadraticBezierTo(width * 0.5, height, 0, height * 0.8);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
