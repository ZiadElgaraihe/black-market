part of 'resend_veification_code_cubit.dart';

@immutable
sealed class ResendVeificationCodeState {}

final class ResendVeificationCodeInitial extends ResendVeificationCodeState {}

final class ResendVeificationCodeLoading extends ResendVeificationCodeState {}

final class ResendVeificationCodeSuccess extends ResendVeificationCodeState {}

final class ResendVeificationCodeFailure extends ResendVeificationCodeState {
  ResendVeificationCodeFailure({required this.errMessage});

  final String errMessage;
}
