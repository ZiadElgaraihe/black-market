import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/alert_dialogs/result_alert_dialog.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/blocs/builder_states/articles_success.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/blocs/builder_states/notifications_feature_failure.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/blocs/builder_states/notifications_feature_loading.dart';
import 'package:black_market/features/notifications/presentation/view_model/get_articles_cubit/get_articles_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetArticlesBlocConsumer extends StatelessWidget {
  const GetArticlesBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    GetArticlesCubit cubit = context.read<GetArticlesCubit>();
    return BlocConsumer<GetArticlesCubit, GetArticlesState>(
      listener: _listener,
      builder: (context, state) {
        if (state is GetArticlesLoading) {
          return const NotificationsFeatureLoading();
        } else if (state is GetArticlesSuccess || cubit.articlesMap != null) {
          return const ArticlesSuccess();
        } else {
          return NotificationsFeatureFailure(
            onRefresh: () async {
              cubit.getArticles(isRefresh: true);
            },
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
}
