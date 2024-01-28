import 'package:black_market/features/notifications/presentation/view/widgets/blocs/get_one_article_bloc_consumer.dart';
import 'package:black_market/features/notifications/presentation/view_model/get_one_article_cubit/get_one_article_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetOneArticleFutureBuilder extends StatelessWidget {
  const GetOneArticleFutureBuilder({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<GetOneArticleCubit>().getOneArticle(id: id),
      builder: (context, snapshot) => const GetOneArticleBlocConsumer(),
    );
  }
}
