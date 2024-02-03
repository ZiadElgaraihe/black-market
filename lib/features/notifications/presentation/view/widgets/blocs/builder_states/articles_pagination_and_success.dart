import 'package:black_market/core/presentation/view_model/localization_cubit/localization_cubit.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/columns/articles_date_section_column.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/list_views/notifications_feature_list_view_builder.dart';
import 'package:black_market/features/notifications/presentation/view_model/get_articles_cubit/get_articles_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ArticlesPaginationAndSuccess extends StatefulWidget {
  const ArticlesPaginationAndSuccess({
    super.key,
    required this.isFailureValueNotifier,
  });

  final ValueNotifier<bool> isFailureValueNotifier;

  @override
  State<ArticlesPaginationAndSuccess> createState() =>
      _ArticlesPaginationAndSuccessState();
}

class _ArticlesPaginationAndSuccessState
    extends State<ArticlesPaginationAndSuccess> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  Future<void> _scrollListener() async {
    GetArticlesCubit cubit = context.read<GetArticlesCubit>();
    double currentPosition = _scrollController.position.pixels;
    double maxScrollExtent = _scrollController.position.maxScrollExtent;
    //if state is failure or pagination failure and current position is the max
    if ((cubit.state is GetArticlesFailure ||
            cubit.state is GetArticlesPaginationFailure) &&
        currentPosition == maxScrollExtent) {
      //this condition is made to prevent making more than one request at a time
      if (cubit.state is GetArticlesPaginationLoading) return;
      //make sure that no failure message is already appear before make the request
      //this condition is made to prevent appearing more than one error message
      //at a time
      if (!widget.isFailureValueNotifier.value) {
        await BlocProvider.of<GetArticlesCubit>(context)
            .getArticles(isPagination: true);
      }
    }
    //if state is success and current position is bigger than 75% of the max
    else if (cubit.state is GetArticlesSuccess &&
        currentPosition >= 0.75 * maxScrollExtent) {
      //this condition is made to prevent making more than one request at a time
      if (cubit.state is GetArticlesPaginationLoading) return;
      await BlocProvider.of<GetArticlesCubit>(context)
          .getArticles(isPagination: true);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GetArticlesCubit cubit = context.read<GetArticlesCubit>();
    return RefreshIndicator(
      onRefresh: () async {
        cubit.getArticles(isRefresh: true);
      },
      color: AppColors.yellow,
      child: NotificationsFeatureListViewBuilder(
        scrollController: _scrollController,
        itemCount: cubit.articlesMap.length + 1,
        itemBuilder: (context, index) {
          if (index >= cubit.articlesMap.keys.length) {
            if (cubit.state is GetArticlesPaginationFailure ||
                cubit.state is GetArticlesFailure) {
              return const SizedBox();
            }
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.yellow,
                ),
              ),
            );
          } else {
            return ArticlesDateSectionColumn(
              date: _modifyDateFormat(
                context,
                cubit.articlesMap.keys.toList()[index],
              ),
              articles: cubit.articlesMap.values.toList()[index],
            );
          }
        },
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
