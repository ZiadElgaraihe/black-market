import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/core/functions/execute_and_handle_errors.dart';
import 'package:black_market/core/helpers/dio_helper.dart';
import 'package:black_market/features/notifications/data/models/notification_model.dart';
import 'package:dartz/dartz.dart';

part 'package:black_market/features/notifications/data/services/notifications_services.dart';

abstract class NotificationsRepo {
  Future<Either<Failure, List<NotificationModel>>> getNotifications();
}
