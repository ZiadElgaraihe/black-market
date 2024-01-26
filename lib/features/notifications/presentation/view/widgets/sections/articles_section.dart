import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/alert_dialogs/result_alert_dialog.dart';
import 'package:black_market/core/presentation/view_model/localization_cubit/localization_cubit.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/columns/articles_date_section_column.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/list_views/notifications_list_view_builder.dart';
import 'package:black_market/features/notifications/presentation/view_model/get_articles_cubit/get_articles_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ArticlesSection extends StatelessWidget {
  const ArticlesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<GetArticlesCubit>().getArticles(),
      builder: (context, snapshot) => const GetArticlesBlocConsumer(),
    );
  }
}

class GetArticlesBlocConsumer extends StatelessWidget {
  const GetArticlesBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    GetArticlesCubit cubit = context.read<GetArticlesCubit>();
    return BlocConsumer<GetArticlesCubit, GetArticlesState>(
      listener: _listener,
      builder: (context, state) {
        if (state is GetArticlesLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.yellow,
            ),
          );
        } else if (state is GetArticlesSuccess) {
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
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              cubit.getArticles(isRefresh: true);
            },
            color: AppColors.yellow,
            child: ListView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.38,
                ),
                Center(
                  child: Text(
                    'لا توجد بيانات لعرضها',
                    style: TextStyles.textStyle14.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  void _listener(context, state) {
    if (state is GetArticlesFailure) {
      showAlertDialog(
        context,
        child: ResultAlertDialog(
          buttonTitle: Tr.of(context).cancel,
          message: state.errMessage,
          onPressed: () {
            Navigator.pop(context);
          },
          title: Tr.of(context).failure,
        ),
      );
    }
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
