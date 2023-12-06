import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/currency/presentation/view/widgets/columns/currency_header_app_info_column.dart';
import 'package:black_market/features/currency/presentation/view/widgets/containers/currency_header_price_container.dart';
import 'package:black_market/features/currency/presentation/view/widgets/rows/currency_header_profile_info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyHeaderSection extends StatelessWidget {
  const CurrencyHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.h,
      child: Stack(
        children: [
          ClipPath(
            clipper: CurrencyHeaderCustomClipper(),
            child: Container(
              width: double.infinity,
              color: AppColors.darkGrey,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 4.h),
                const CurrencyHeaderProfileInfoRow(),
                SizedBox(height: 26.h),
                const CurrencyHeaderAppInfoColumn(),
                SizedBox(height: 30.h),
                const CurrencyHeaderPriceContainer(),
              ],
            ),
          ),
        ],
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
