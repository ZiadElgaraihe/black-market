import 'package:black_market/features/notifications/presentation/view/widgets/blocs/get_articles_bloc_consumer.dart';
import 'package:black_market/features/notifications/presentation/view_model/get_articles_cubit/get_articles_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticlesSection extends StatelessWidget {
  const ArticlesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<GetArticlesCubit>().getArticles(),
      builder: (context, snapshot) => const GetArticlesBlocConsumer(),
    );
  }
}
