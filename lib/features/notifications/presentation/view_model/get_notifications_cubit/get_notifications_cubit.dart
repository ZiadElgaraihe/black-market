import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/features/notifications/data/models/notification_model.dart';
import 'package:black_market/features/notifications/data/repos/notifications_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'get_notifications_state.dart';

class GetNotificationsCubit extends Cubit<GetNotificationsState> {
  GetNotificationsCubit({
    required ConnectionServices connectionServices,
    required NotificationsServices notificationsServices,
  }) : super(GetNotificationsInitial()) {
    _connectionServices = connectionServices;
    _notificationsServices = notificationsServices;
  }

  late ConnectionServices _connectionServices;
  late NotificationsServices _notificationsServices;

  Map<String, List<NotificationModel>> notificationsMap = {};
  int _pageNumber = 1;
  bool _hasMore = true;

  Future<void> getNotifications({
    bool isRefresh = false,
    bool isPagination = false,
  }) async {
    if (!isRefresh && !isPagination && notificationsMap.isNotEmpty) {
      emit(
        GetNotificationsSuccess(),
      );
    } else if (!_hasMore && !isRefresh) {
      emit(
        GetNotificationsPaginationFailure(),
      );
    } else {
      Either<ConnectionFailure, void> connectionResult =
          await _connectionServices.checkInternetConnection();

      connectionResult.fold(
        //no connection
        (connectionFailure) {
          emit(
            GetNotificationsFailure(errMessage: connectionFailure.errMessage),
          );
        },
        //connection
        (_) async {
          if (isPagination) {
            emit(GetNotificationsPaginationLoading());
          } else {
            if (isRefresh) {
              if (!_hasMore) _hasMore = true;
              _pageNumber = 1;
              notificationsMap = {};
            }
            emit(GetNotificationsLoading());
          }

          Either<Failure, List<NotificationModel>> result =
              await _notificationsServices.getNotifications(
            pageNumber: _pageNumber,
          );

          result.fold(
            //error
            (failure) {
              emit(
                GetNotificationsFailure(errMessage: failure.errMessage),
              );
            },
            //success
            (notifications) {
              if (notifications.isNotEmpty) {
                _groupNotificationsByDate(notifications);

                _pageNumber++;

                emit(
                  GetNotificationsSuccess(),
                );
              } else {
                _hasMore = false;
                emit(
                  GetNotificationsPaginationFailure(),
                );
              }
            },
          );
        },
      );
    }
  }

  // Helper function to group notifications by date
  void _groupNotificationsByDate(
    List<NotificationModel> notifications,
  ) {
    for (NotificationModel notification in notifications) {
      DateTime dateTime = DateTime.parse(notification.notificationDate);
      String formattedDate = DateFormat('yyyy-MM-dd', 'en').format(dateTime);

      if (!notificationsMap.containsKey(formattedDate)) {
        notificationsMap[formattedDate] = [];
      }

      notificationsMap[formattedDate]!.add(notification);
    }
  }
}
