part of 'get_ingots_coins_data_cubit.dart';

@immutable
sealed class GetIngotsCoinsDataState {}

final class GetIngotsCoinsDataInitial extends GetIngotsCoinsDataState {}

final class GetIngotsCoinsDataLoading extends GetIngotsCoinsDataState {}

final class GetIngotsCoinsDataSuccess extends GetIngotsCoinsDataState {}

final class GetIngotsCoinsDataFailure extends GetIngotsCoinsDataState {
  final String errMessage;

  GetIngotsCoinsDataFailure({required this.errMessage});
}
