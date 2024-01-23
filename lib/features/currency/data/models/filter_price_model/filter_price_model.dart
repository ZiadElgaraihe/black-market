import 'package:hive_flutter/hive_flutter.dart';

part 'filter_price_model.g.dart';

@HiveType(typeId: 3)
class FilterPriceModel {
  @HiveField(0)
  double price;
  @HiveField(1)
  String date;

  FilterPriceModel({
    required this.price,
    required this.date,
  });

  factory FilterPriceModel.fromJson({required Map<String, dynamic> data}) {
    return FilterPriceModel(
      price: (data['price'] is int)
          ? data['price'].toDouble()
          : data['price'],
      date: data['date'],
    );
  }
}
