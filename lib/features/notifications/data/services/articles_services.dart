part of 'package:black_market/features/notifications/data/repos/articles_repo.dart';

class ArticlesServices implements ArticlesRepo {
  ArticlesServices({required DioHelper dioHelper}) {
    _dioHelper = dioHelper;
  }

  late DioHelper _dioHelper;

  @override
  Future<Either<Failure, List<ArticleModel>>> getArticles({
    int pageNumber = 1,
  }) async {
    return await executeAndHandleErrors<List<ArticleModel>>(
      () async {
        Map<String, dynamic> data = await _dioHelper.getRequest(
          endPoint: 'articles?start_date=2023-10-06&page=$pageNumber',
        );

        return _parseDataToListOfArticleModel(data);
      },
    );
  }

  @override
  Future<Either<Failure, ArticleModel>> getOneArticle({
    required CancelToken cancelToken,
    required int id,
  }) async {
    return await executeAndHandleErrors<ArticleModel>(
      () async {
        Map<String, dynamic> data = await _dioHelper.getRequest(
          endPoint: 'articles/$id',
          cancelToken: cancelToken,
        );

        return ArticleModel.fromJson(data: data['data'][0]);
      },
    );
  }

  List<ArticleModel> _parseDataToListOfArticleModel(Map<String, dynamic> data) {
    List<ArticleModel> articles = <ArticleModel>[];

    for (var article in data['data']) {
      articles.add(
        ArticleModel.fromJson(data: article),
      );
    }

    return articles;
  }
}
