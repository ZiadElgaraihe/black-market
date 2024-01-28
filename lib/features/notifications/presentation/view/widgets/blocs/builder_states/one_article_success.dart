import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/notifications/data/models/article_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class OneArticleSuccess extends StatelessWidget {
  const OneArticleSuccess({
    super.key,
    required this.article,
  });

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        physics: const BouncingScrollPhysics(),
        children: [
          Text(
            article.title,
            style: TextStyles.textStyle16.copyWith(
              color: AppColors.lightYellowActive,
            ),
          ),
          SizedBox(height: 18.h),
          Text(
            article.shortDescription,
            style: TextStyles.textStyle12.copyWith(
              color: AppColors.grey,
            ),
          ),
          SizedBox(height: 32.h),
          HtmlWidget(
            article.description!,
            enableCaching: true,
            textStyle: TextStyles.textStyle10,
            customWidgetBuilder: (element) {
              if (element.localName == 'img') {
                final src = element.attributes['src'];
                return CachedNetworkImage(
                  imageUrl: src!,
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
                  fit: BoxFit.fill,
                );
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
