import 'package:black_market/core/data/services/local_database_services.dart';
import 'package:black_market/core/utils/constants.dart';
import 'package:black_market/features/currency/data/models/currency_price_model/currency_price_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit({
    required LocalDatabaseServices localDatabaseServices,
  }) : super(FavouriteInitial()) {
    _localDatabaseServices = localDatabaseServices;
  }

  late LocalDatabaseServices _localDatabaseServices;

  List<CurrencyPriceModel> favouriteData = [];

  Future<void> addToFavourite({
    required CurrencyPriceModel bankPrice,
  }) async {
    favouriteData.add(bankPrice);

    await _localDatabaseServices.addToList<CurrencyPriceModel>(
      boxName: kFavouriteBox,
      key: kFavouriteKey,
      value: bankPrice,
    );
  }

  Future<void> getFavourite() async {
    if (favouriteData.isEmpty) {
      var returnedData = await _localDatabaseServices.get(
        boxName: kFavouriteBox,
        key: kFavouriteKey,
      );

      if (returnedData != null) {
        favouriteData = [];
        for (var element in returnedData) {
          favouriteData.add(element);
        }
      }
    }
  }

  Future<void> removeFromFavourite({
    required CurrencyPriceModel bankPrice,
  }) async {
    favouriteData.removeWhere((element) => element.id == bankPrice.id);

    await _localDatabaseServices.deleteFromList(
      boxName: kFavouriteBox,
      key: kFavouriteKey,
      value: bankPrice,
    );

    emit(FavouriteInitial());
  }
}
