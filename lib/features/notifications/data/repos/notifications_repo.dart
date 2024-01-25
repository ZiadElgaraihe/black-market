import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/features/notifications/data/models/notification_model.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationsRepo {
  Future<Either<Failure, List<NotificationModel>>> getNotifications();
}
