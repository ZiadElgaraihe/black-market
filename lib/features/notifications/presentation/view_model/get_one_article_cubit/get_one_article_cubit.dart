import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/features/notifications/data/models/article_model.dart';
import 'package:black_market/features/notifications/data/repos/articles_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_one_article_state.dart';

class GetOneArticleCubit extends Cubit<GetOneArticleState> {
  GetOneArticleCubit({
    required ArticlesServices articlesServices,
    required ConnectionServices connectionServices,
  }) : super(GetOneArticleInitial()) {
    _articlesServices = articlesServices;
    _connectionServices = connectionServices;
  }

  late ArticlesServices _articlesServices;
  late ConnectionServices _connectionServices;

  Future<void> getOneArticle({required int id}) async {
    Either<ConnectionFailure, void> connectionResult =
        await _connectionServices.checkInternetConnection();

    connectionResult.fold(
      //no connection
      (connectionFailure) {
        emit(
          GetOneArticleFailure(errMessage: connectionFailure.errMessage),
        );
      },
      //connection
      (_) async {
        emit(GetOneArticleLoading());

        Either<Failure, ArticleModel> result =
            await _articlesServices.getOneArticle(id: id);

        result.fold(
          //error
          (failure) {
            emit(
              GetOneArticleFailure(errMessage: failure.errMessage),
            );
          },
          //success
          (article) {
            emit(
              GetOneArticleSuccess(article: article),
            );
          },
        );
      },
    );
  }
}
