import 'package:black_market/features/notifications/data/models/article_model.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/dividers/date_divider.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/rows/article_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticlesDateSectionColumn extends StatelessWidget {
  const ArticlesDateSectionColumn({
    super.key,
    required this.date,
    required this.articles,
  });

  final String date;
  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateDivider(
          date: date,
        ),
        Column(
          children: List.generate(
            articles.length,
            (index) => InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(14.w),
              child: ArticleRow(
                article: articles[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
