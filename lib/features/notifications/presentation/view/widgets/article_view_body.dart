import 'package:black_market/features/notifications/presentation/view/widgets/containers/article_banner_container.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/future_builders/get_one_article_future_builder.dart';
import 'package:flutter/material.dart';

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
        ArticleBannerContainer(banner: banner),
        GetOneArticleFutureBuilder(id: id),
      ],
    );
  }
}
