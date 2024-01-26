import 'package:black_market/features/notifications/presentation/view/widgets/dividers/date_divider.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/rows/article_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticlesDateSectionColumn extends StatelessWidget {
  const ArticlesDateSectionColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DateDivider(
          date: '26 يناير 2024',
        ),
        Column(
          children: List.generate(
            5,
            (index) => InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(14.w),
              child: const ArticleRow(),
            ),
          ),
        ),
      ],
    );
  }
}
