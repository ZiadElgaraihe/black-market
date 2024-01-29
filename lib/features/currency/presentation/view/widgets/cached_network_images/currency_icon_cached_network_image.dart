import 'package:black_market/core/utils/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyIconCachedNetworkImage extends StatelessWidget {
  const CurrencyIconCachedNetworkImage({
    super.key,
    required this.height,
    required this.imageUrl,
    required this.width,
  });

  final double height;
  final String imageUrl;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        errorWidget: (context, url, error) {
          return const SizedBox();
        },
        progressIndicatorBuilder: (context, url, progress) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 3.w,
              vertical: 1.h,
            ),
            child: CircularProgressIndicator(
              color: AppColors.black,
            ),
          );
        },
      ),
    );
  }
}
