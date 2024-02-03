part of 'package:black_market/features/notifications/data/repos/notifications_repo.dart';

class NotificationsServices implements NotificationsRepo {
  NotificationsServices({required DioHelper dioHelper}) {
    _dioHelper = dioHelper;
  }

  late DioHelper _dioHelper;

  @override
  Future<Either<Failure, List<NotificationModel>>> getNotifications({
    int pageNumber = 1,
  }) async {
    return await executeAndHandleErrors(() async {
      String endPoint =
          'notifications?start_date=2023-10-07&topics=marketing%2Cnew_marketing%2Cmarketing_1_0_10%2Cgold%2Ccurrencies%2Cnews&page=$pageNumber';
      Map<String, dynamic> data = await _dioHelper.getRequest(
        endPoint: endPoint,
      );

      List<NotificationModel> notifications = <NotificationModel>[];
      for (var notification in data['data']) {
        notifications.add(
          NotificationModel.fromJson(
            data: notification,
          ),
        );
      }

      return notifications;
    });
  }
}
