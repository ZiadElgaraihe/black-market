import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/presentation/view/app_bars/default_app_bar.dart';
import 'package:black_market/core/utils/service_locator.dart';
import 'package:black_market/features/notifications/data/repos/articles_repo.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/article_view_body.dart';
import 'package:black_market/features/notifications/presentation/view_model/get_one_article_cubit/get_one_article_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({
    super.key,
    required this.banner,
    required this.id,
  });

  final String banner;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetOneArticleCubit>(
      create: (context) => GetOneArticleCubit(
        articlesServices: getIt<ArticlesServices>(),
        connectionServices: getIt<ConnectionServices>(),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const DefaultAppBar(title: ''),
        body: ArticleViewBody(
          banner: banner,
          id: id,
        ),
      ),
    );
  }
}
