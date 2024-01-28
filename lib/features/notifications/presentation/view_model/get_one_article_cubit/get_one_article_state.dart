part of 'get_one_article_cubit.dart';

@immutable
sealed class GetOneArticleState {}

final class GetOneArticleInitial extends GetOneArticleState {}

final class GetOneArticleLoading extends GetOneArticleState {}

final class GetOneArticleSuccess extends GetOneArticleState {
  final ArticleModel article;

  GetOneArticleSuccess({required this.article});
}

final class GetOneArticleFailure extends GetOneArticleState {
  final String errMessage;

  GetOneArticleFailure({required this.errMessage});
}
