import 'package:black_market/core/functions/show_alert_dialog.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/alert_dialogs/result_alert_dialog.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/blocs/builder_states/notifications_feature_failure.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/blocs/builder_states/notifications_feature_loading.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/blocs/builder_states/notifications_pagination_and_success.dart';
import 'package:black_market/features/notifications/presentation/view_model/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetNotificationsBlocConsumer extends StatefulWidget {
  const GetNotificationsBlocConsumer({super.key});

  @override
  State<GetNotificationsBlocConsumer> createState() =>
      _GetNotificationsBlocConsumerState();
}

class _GetNotificationsBlocConsumerState
    extends State<GetNotificationsBlocConsumer> {
  final ValueNotifier<bool> _isFailure = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isFailure.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GetNotificationsCubit cubit = context.read<GetNotificationsCubit>();
    return BlocConsumer<GetNotificationsCubit, GetNotificationsState>(
      listener: _listener,
      builder: (context, state) {
        if (state is GetNotificationsLoading) {
          return const NotificationsFeatureLoading();
        }
        //make different conditions for the same widget
        //to make sure that ui is rebuilt
        /* ************************************************* */
        else if (state is GetNotificationsPaginationLoading) {
          return NotificationsPaginationAndSuccess(
            isFailureValueNotifier: _isFailure,
          );
        } else if (state is GetNotificationsPaginationFailure ||
            (state is GetNotificationsFailure &&
                cubit.notificationsMap.isNotEmpty)) {
          return NotificationsPaginationAndSuccess(
            isFailureValueNotifier: _isFailure,
          );
        } else if (state is GetNotificationsSuccess) {
          return NotificationsPaginationAndSuccess(
            isFailureValueNotifier: _isFailure,
          );
        }
        /* ************************************************* */
        else {
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
