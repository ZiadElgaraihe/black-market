part of 'get_gold_data_cubit.dart';

@immutable
sealed class GetGoldDataState {}

final class GetGoldDataInitial extends GetGoldDataState {}

final class GetGoldDataLoading extends GetGoldDataState {}

final class GetGoldDataSuccess extends GetGoldDataState {}

final class GetGoldDataFailure extends GetGoldDataState {
  final String errMessage;

  GetGoldDataFailure({required this.errMessage});
}
