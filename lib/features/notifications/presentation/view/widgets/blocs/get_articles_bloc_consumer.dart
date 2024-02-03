import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/alert_dialogs/result_alert_dialog.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/blocs/builder_states/articles_pagination_and_success.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/blocs/builder_states/notifications_feature_failure.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/blocs/builder_states/notifications_feature_loading.dart';
import 'package:black_market/features/notifications/presentation/view_model/get_articles_cubit/get_articles_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetArticlesBlocConsumer extends StatefulWidget {
  const GetArticlesBlocConsumer({super.key});

  @override
  State<GetArticlesBlocConsumer> createState() =>
      _GetArticlesBlocConsumerState();
}

class _GetArticlesBlocConsumerState extends State<GetArticlesBlocConsumer> {
  final ValueNotifier<bool> _isFailure = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isFailure.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GetArticlesCubit cubit = context.read<GetArticlesCubit>();
    return BlocConsumer<GetArticlesCubit, GetArticlesState>(
      listener: _listener,
      builder: (context, state) {
        if (state is GetArticlesLoading) {
          return const NotificationsFeatureLoading();
        }
        //make different conditions for the same widget
        //to make sure that ui is rebuilt
        /* ************************************************* */
        else if (state is GetArticlesPaginationLoading) {
          return ArticlesPaginationAndSuccess(
            isFailureValueNotifier: _isFailure,
          );
        } else if (state is GetArticlesPaginationFailure ||
            (state is GetArticlesFailure &&
                cubit.articlesMap.isNotEmpty)) {
          return ArticlesPaginationAndSuccess(
            isFailureValueNotifier: _isFailure,
          );
        } else if (state is GetArticlesSuccess) {
          return ArticlesPaginationAndSuccess(
            isFailureValueNotifier: _isFailure,
          );
        }
        /* ************************************************* */
        else {
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
      _isFailure.value = true;
      showAlertDialog(
        context,
        onPopInvoked: (didPop) {
          _isFailure.value = false;
        },
        child: ResultAlertDialog(
          buttonTitle: Tr.of(context).cancel,
          message: state.errMessage,
          onPressed: () {
            _isFailure.value = false;
            Navigator.pop(context);
          },
          title: Tr.of(context).failure,
        ),
      );
    }
  }
}
