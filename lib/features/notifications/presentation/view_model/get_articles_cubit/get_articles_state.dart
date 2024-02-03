part of 'get_articles_cubit.dart';

@immutable
sealed class GetArticlesState {}

final class GetArticlesInitial extends GetArticlesState {}

final class GetArticlesLoading extends GetArticlesState {}

final class GetArticlesPaginationLoading extends GetArticlesState {}

final class GetArticlesPaginationFailure extends GetArticlesState {}

final class GetArticlesSuccess extends GetArticlesState {}

final class GetArticlesFailure extends GetArticlesState {
  final String errMessage;

  GetArticlesFailure({required this.errMessage});
}
