import 'dart:async';

import 'package:black_market/core/presentation/view_model/localization_cubit/localization_cubit.dart';
import 'package:black_market/core/utils/app_colors.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/columns/notifications_date_section_column.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/list_views/notifications_feature_list_view_builder.dart';
import 'package:black_market/features/notifications/presentation/view_model/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class NotificationsPaginationAndSuccess extends StatefulWidget {
  const NotificationsPaginationAndSuccess({
    super.key,
    required this.isFailureValueNotifier,
  });

  final ValueNotifier<bool> isFailureValueNotifier;

  @override
  State<NotificationsPaginationAndSuccess> createState() =>
      _NotificationsPaginationAndSuccessState();
}

class _NotificationsPaginationAndSuccessState
    extends State<NotificationsPaginationAndSuccess> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  Future<void> _scrollListener() async {
    GetNotificationsCubit cubit = context.read<GetNotificationsCubit>();
    double currentPosition = _scrollController.position.pixels;
    double maxScrollExtent = _scrollController.position.maxScrollExtent;
    //if state is failure or pagination failure and current position is the max
    if ((cubit.state is GetNotificationsFailure ||
            cubit.state is GetNotificationsPaginationFailure) &&
        currentPosition == maxScrollExtent) {
      //this condition is made to prevent making more than one request at a time
      if (cubit.state is GetNotificationsPaginationLoading) return;
      //make sure that no failure message is already appear before make the request
      //this condition is made to prevent appearing more than one error message
      //at a time
      if (!widget.isFailureValueNotifier.value) {
        await BlocProvider.of<GetNotificationsCubit>(context)
            .getNotifications(isPagination: true);
      }
    }
    //if state is success and current position is bigger than 75% of the max
    else if (cubit.state is GetNotificationsSuccess &&
        currentPosition >= 0.75 * maxScrollExtent) {
      //this condition is made to prevent making more than one request at a time
      if (cubit.state is GetNotificationsPaginationLoading) return;
      await BlocProvider.of<GetNotificationsCubit>(context)
          .getNotifications(isPagination: true);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GetNotificationsCubit cubit = context.read<GetNotificationsCubit>();
    return RefreshIndicator(
      onRefresh: () async {
        cubit.getNotifications(isRefresh: true);
      },
      color: AppColors.yellow,
      child: NotificationsFeatureListViewBuilder(
        scrollController: _scrollController,
        itemCount: cubit.notificationsMap.keys.length + 1,
        itemBuilder: (context, index) {
          if (index >= cubit.notificationsMap.keys.length) {
            if (cubit.state is GetNotificationsPaginationFailure ||
                cubit.state is GetNotificationsFailure) {
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
            return NotificationsDateSectionColumn(
              date: _modifyDateFormat(
                context,
                cubit.notificationsMap.keys.toList()[index],
              ),
              notifications: cubit.notificationsMap.values.toList()[index],
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
