class ArticleModel {
  final int id;
  final String thumbnail;
  final String banner;
  final String title;
  final String shortDescription;
  final String createdAt;

  ArticleModel({
    required this.id,
    required this.thumbnail,
    required this.banner,
    required this.title,
    required this.shortDescription,
    required this.createdAt,
  });

  factory ArticleModel.fromJson({required Map<String, dynamic> data}) {
    return ArticleModel(
      id: data['id'],
      thumbnail: data['thumbnail'],
      banner: data['banner'],
      title: data['title'],
      shortDescription: data['short_description'],
      createdAt: data['created_at'],
    );
  }
}
