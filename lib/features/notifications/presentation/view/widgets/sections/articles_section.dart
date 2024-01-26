import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/columns/articles_date_section_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticlesSection extends StatelessWidget {
  const ArticlesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      color: AppColors.yellow,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemCount: 3,
        itemBuilder: (context, index) => const ArticlesDateSectionColumn(),
      ),
    );
  }
}
