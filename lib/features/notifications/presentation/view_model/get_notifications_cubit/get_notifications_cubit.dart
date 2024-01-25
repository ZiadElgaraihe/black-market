import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/core/presentation/view_model/localization_cubit/localization_cubit.dart';
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
    required LocalizationCubit localizationCubit,
    required NotificationsServices notificationsServices,
  }) : super(GetNotificationsInitial()) {
    _connectionServices = connectionServices;
    _localizationCubit = localizationCubit;
    _notificationsServices = notificationsServices;
  }

  late ConnectionServices _connectionServices;
  late LocalizationCubit _localizationCubit;
  late NotificationsServices _notificationsServices;

  Map<String, List<NotificationModel>>? notificationsMap;

  Future<void> getNotifications({bool isRefresh = false}) async {
    if (!isRefresh && notificationsMap != null) {
      emit(
        GetNotificationsSuccess(),
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
          emit(GetNotificationsLoading());

          Either<Failure, List<NotificationModel>> result =
              await _notificationsServices.getNotifications();

          result.fold(
            //error
            (failure) {
              emit(
                GetNotificationsFailure(errMessage: failure.errMessage),
              );
            },
            //success
            (notifications) {
              notificationsMap = _groupNotificationsByDate(notifications);

              emit(
                GetNotificationsSuccess(),
              );
            },
          );
        },
      );
    }
  }

  // Helper function to group notifications by date
  Map<String, List<NotificationModel>> _groupNotificationsByDate(
      List<NotificationModel> notifications) {
    Map<String, List<NotificationModel>> result = {};

    for (NotificationModel notification in notifications) {
      DateTime dateTime = DateTime.parse(notification.notificationDate);
      String formattedDate = DateFormat(
        'dd MMM yyyy',
        _localizationCubit.appLocale.languageCode,
      ).format(dateTime);

      if (!result.containsKey(formattedDate)) {
        result[formattedDate] = [];
      }

      result[formattedDate]!.add(notification);
    }

    return result;
  }
}
