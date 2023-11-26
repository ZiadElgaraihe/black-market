part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordSuccess extends ForgetPasswordState {
  ForgetPasswordSuccess({required this.email});

  final String email;
}

final class ForgetPasswordFailure extends ForgetPasswordState {
  ForgetPasswordFailure({required this.errMessage});

  final String errMessage;
}
