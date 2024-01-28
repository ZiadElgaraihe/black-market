import 'package:black_market/core/utils/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleBannerContainer extends StatelessWidget {
  const ArticleBannerContainer({
    super.key,
    required this.banner,
    required this.id,
  });

  final String banner;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: Container(
        padding: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16.w),
          ),
        ),
        child: CachedNetworkImage(
          imageUrl: banner,
          errorWidget: (context, url, error) {
            return const Placeholder();
          },
          progressIndicatorBuilder: (context, url, progress) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.white,
              ),
            );
          },
          height: 300.h,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
