import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/alert_dialogs/result_alert_dialog.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/blocs/builder_states/notifications_feature_loading.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/blocs/builder_states/one_article_success.dart';
import 'package:black_market/features/notifications/presentation/view_model/get_one_article_cubit/get_one_article_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetOneArticleBlocConsumer extends StatelessWidget {
  const GetOneArticleBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetOneArticleCubit, GetOneArticleState>(
      listener: _listener,
      builder: (context, state) {
        if (state is GetOneArticleSuccess) {
          return OneArticleSuccess(article: state.article);
        } else {
          return const NotificationsFeatureLoading();
        }
      },
    );
  }

  void _listener(context, state) {
    if (state is GetOneArticleFailure) {
      showAlertDialog(
        context,
        canDismiss: false,
        child: ResultAlertDialog(
          buttonTitle: Tr.of(context).cancel,
          message: state.errMessage,
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          title: Tr.of(context).failure,
        ),
      );
    }
  }
}
