import 'package:black_market/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppImages.assetsImagesLogoPng,
        height: 279.h,
        width: 279.w,
        fit: BoxFit.contain,
      ),
    );
  }
}
