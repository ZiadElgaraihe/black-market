import 'package:black_market/features/notifications/presentation/view/widgets/future_builders/get_one_article_future_builder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleViewBody extends StatelessWidget {
  const ArticleViewBody({
    super.key,
    required this.banner,
    required this.id,
  });

  final String banner;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16.w),
            ),
            child: CachedNetworkImage(
              imageUrl: banner,
              fit: BoxFit.fitWidth,
              height: 300.h,
            ),
          ),
        ),
        GetOneArticleFutureBuilder(id: id),
      ],
    );
  }
}
