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
  final String errMessage;

  CurrencyLatestFailure({required this.errMessage});
}
