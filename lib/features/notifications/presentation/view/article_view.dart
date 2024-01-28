import 'package:black_market/core/presentation/view/app_bars/default_app_bar.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/article_view_body.dart';
import 'package:flutter/material.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({
    super.key,
    required this.banner,
  });

  final String banner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const DefaultAppBar(title: ''),
      body: ArticleViewBody(banner: banner),
    );
  }
}
