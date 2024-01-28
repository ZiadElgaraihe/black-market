import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/core/functions/execute_and_handle_errors.dart';
import 'package:black_market/core/helpers/dio_helper.dart';
import 'package:black_market/features/notifications/data/models/article_model.dart';
import 'package:dartz/dartz.dart';

part 'package:black_market/features/notifications/data/services/articles_services.dart';

abstract class ArticlesRepo {
  Future<Either<Failure, List<ArticleModel>>> getArticles();

  Future<Either<Failure, ArticleModel>> getOneArticle({
    required int id,
  });
}
