part of 'get_notifications_cubit.dart';

@immutable
sealed class GetNotificationsState {}

final class GetNotificationsInitial extends GetNotificationsState {}

final class GetNotificationsLoading extends GetNotificationsState {}

final class GetNotificationsPaginationLoading extends GetNotificationsState {}

final class GetNotificationsPaginationFailure extends GetNotificationsState {}

final class GetNotificationsSuccess extends GetNotificationsState {}

final class GetNotificationsFailure extends GetNotificationsState {
  final String errMessage;

  GetNotificationsFailure({required this.errMessage});
}
