import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/features/notifications/data/models/article_model.dart';
import 'package:dartz/dartz.dart';

abstract class ArticlesRepo {
  Future<Either<Failure, List<ArticleModel>>> getArticles();
}
