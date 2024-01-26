import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/features/notifications/data/models/article_model.dart';
import 'package:black_market/features/notifications/data/repos/articles_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'get_articles_state.dart';

class GetArticlesCubit extends Cubit<GetArticlesState> {
  GetArticlesCubit({
    required ArticlesServices articlesServices,
    required ConnectionServices connectionServices,
  }) : super(GetArticlesInitial()) {
    _articlesServices = articlesServices;
    _connectionServices = connectionServices;
  }

  late ArticlesServices _articlesServices;
  late ConnectionServices _connectionServices;

  Map<String, List<ArticleModel>>? articlesMap;

  Future<void> getArticles({bool isRefresh = false}) async {
    if (!isRefresh && articlesMap != null) {
      emit(
        GetArticlesSuccess(),
      );
    } else {
      Either<ConnectionFailure, void> connectionResult =
          await _connectionServices.checkInternetConnection();

      connectionResult.fold(
        //no connection
        (connectionFailure) {
          emit(
            GetArticlesFailure(errMessage: connectionFailure.errMessage),
          );
        },
        //connection
        (_) async {
          emit(GetArticlesLoading());

          Either<Failure, List<ArticleModel>> result =
              await _articlesServices.getArticles();

          result.fold(
            //error
            (failure) {
              emit(
                GetArticlesFailure(errMessage: failure.errMessage),
              );
            },
            //success
            (articles) {
              articlesMap = _groupArticlesByDate(articles);
              
              emit(GetArticlesSuccess());
            },
          );
        },
      );
    }
  }

  // Helper function to group articles by date
  Map<String, List<ArticleModel>> _groupArticlesByDate(
    List<ArticleModel> articles,
  ) {
    Map<String, List<ArticleModel>> result = {};

    for (var article in articles) {
      DateTime dateTime = DateTime.parse(article.createdAt);
      String formattedDate = DateFormat('yyyy-MM-dd', 'en').format(dateTime);

      if (!result.containsKey(formattedDate)) {
        result[formattedDate] = [];
      }

      result[formattedDate]!.add(article);
    }

    return result;
  }
}
