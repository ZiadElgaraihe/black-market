import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/alert_dialogs/result_alert_dialog.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/blocs/builder_states/notifications_feature_failure.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/blocs/builder_states/notifications_feature_loading.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/blocs/builder_states/notifications_success.dart';
import 'package:black_market/features/notifications/presentation/view_model/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetNotificationsBlocConsumer extends StatelessWidget {
  const GetNotificationsBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    GetNotificationsCubit cubit = context.read<GetNotificationsCubit>();
    return BlocConsumer<GetNotificationsCubit, GetNotificationsState>(
      listener: _listener,
      builder: (context, state) {
        if (state is GetNotificationsLoading) {
          return const NotificationsFeatureLoading();
        } else if (state is GetNotificationsSuccess ||
            cubit.notificationsMap != null) {
          return const NotificationsSuccess();
        } else {
          return NotificationsFeatureFailure(
            onRefresh: () async {
              cubit.getNotifications(isRefresh: true);
            },
          );
        }
      },
    );
  }

  void _listener(context, state) {
    if (state is GetNotificationsFailure) {
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
