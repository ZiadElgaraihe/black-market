part of 'package:black_market/features/notifications/data/repos/articles_repo.dart';

class ArticlesServices implements ArticlesRepo {
  ArticlesServices({required DioHelper dioHelper}) {
    _dioHelper = dioHelper;
  }

  late DioHelper _dioHelper;

  @override
  Future<Either<Failure, List<ArticleModel>>> getArticles() async {
    return await executeAndHandleErrors<List<ArticleModel>>(
      () async {
        Map<String, dynamic> data = await _dioHelper.getRequest(
          endPoint: 'articles?start_date=2023-10-06&page=1',
        );

        return _parseDataToListOfArticleModel(data);
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
