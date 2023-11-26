part of 'update_password_cubit.dart';

@immutable
sealed class UpdatePasswordState {}

final class UpdatePasswordInitial extends UpdatePasswordState {}

final class UpdatePasswordLoading extends UpdatePasswordState {}

final class UpdatePasswordSuccess extends UpdatePasswordState {}

final class UpdatePasswordFailure extends UpdatePasswordState {
  UpdatePasswordFailure({required this.errMessage});

  final String errMessage;
}
