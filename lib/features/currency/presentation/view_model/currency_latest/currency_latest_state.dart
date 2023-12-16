part of 'currency_latest_cubit.dart';

@immutable
sealed class CurrencyLatestState {}

final class CurrencyLatestInitial extends CurrencyLatestState {}

final class CurrencyLatestLoading extends CurrencyLatestState {}

final class CurrencyLatestSuccess extends CurrencyLatestState {
  final List<CurrencyModel> currencies;

  CurrencyLatestSuccess({required this.currencies});
}

final class CurrencyLatestFailure extends CurrencyLatestState {
  //This is used when there is data in the cubit and user reload
  //then error occurs
  //So i return the data that was already exist
  final List<CurrencyModel>? currencies;
  final String errMessage;

  CurrencyLatestFailure({required this.errMessage, this.currencies});
}
