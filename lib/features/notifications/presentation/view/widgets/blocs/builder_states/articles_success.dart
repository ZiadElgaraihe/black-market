import 'package:black_market/core/presentation/view_model/localization_cubit/localization_cubit.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/columns/articles_date_section_column.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/list_views/notifications_feature_list_view_builder.dart';
import 'package:black_market/features/notifications/presentation/view_model/get_articles_cubit/get_articles_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ArticlesSuccess extends StatelessWidget {
  const ArticlesSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    GetArticlesCubit cubit = context.read<GetArticlesCubit>();
    return RefreshIndicator(
      onRefresh: () async {
        cubit.getArticles(isRefresh: true);
      },
      color: AppColors.yellow,
      child: NotificationsFeatureListViewBuilder(
        itemCount: cubit.articlesMap!.length,
        itemBuilder: (context, index) => ArticlesDateSectionColumn(
          date: _modifyDateFormat(
            context,
            cubit.articlesMap!.keys.toList()[index],
          ),
          articles: cubit.articlesMap!.values.toList()[index],
        ),
      ),
    );
  }

  //modify date format from (25-01-2024) to (25 Jan 2024)
  String _modifyDateFormat(BuildContext context, String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat(
      'dd MMM yyyy',
      context.read<LocalizationCubit>().appLocale.languageCode,
    ).format(dateTime);
  }
}
