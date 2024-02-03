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

  Map<String, List<ArticleModel>> articlesMap = {};
  int _pageNumber = 1;
  bool _hasMore = true;

  Future<void> getArticles({
    bool isRefresh = false,
    bool isPagination = false,
  }) async {
    if (!isRefresh && !isPagination && articlesMap.isNotEmpty) {
      emit(
        GetArticlesSuccess(),
      );
    } else if (!_hasMore && !isRefresh) {
      emit(
        GetArticlesPaginationFailure(),
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
          if (isPagination) {
            emit(GetArticlesPaginationLoading());
          } else {
            if (isRefresh) {
              if (!_hasMore) _hasMore = true;
              _pageNumber = 1;
              articlesMap = {};
            }
            emit(GetArticlesLoading());
          }

          Either<Failure, List<ArticleModel>> result =
              await _articlesServices.getArticles(
            pageNumber: _pageNumber,
          );

          result.fold(
            //error
            (failure) {
              emit(
                GetArticlesFailure(errMessage: failure.errMessage),
              );
            },
            //success
            (articles) {
              if (articles.isNotEmpty) {
                _groupArticlesByDate(articles);

                _pageNumber++;

                emit(
                  GetArticlesSuccess(),
                );
              } else {
                _hasMore = false;
                emit(
                  GetArticlesPaginationFailure(),
                );
              }
            },
          );
        },
      );
    }
  }

  // Helper function to group articles by date
  void _groupArticlesByDate(
    List<ArticleModel> articles,
  ) {
    for (ArticleModel article in articles) {
      DateTime dateTime = DateTime.parse(article.createdAt);
      String formattedDate = DateFormat('yyyy-MM-dd', 'en').format(dateTime);

      if (!articlesMap.containsKey(formattedDate)) {
        articlesMap[formattedDate] = [];
      }

      articlesMap[formattedDate]!.add(article);
    }
  }
}
