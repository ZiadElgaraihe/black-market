part 'gold_price_model.dart';

class GoldModel {
  int id;
  String name;
  String karat;
  GoldPriceModel price;

  GoldModel({
    required this.id,
    required this.name,
    required this.karat,
    required this.price,
  });

  factory GoldModel.fromJson({required Map<String, dynamic> data}) {
    return GoldModel(
      id: data['id'],
      name: data['name'],
      karat: data['karat'].toString(),
      price: GoldPriceModel.fromJson(data: data['price']),
    );
  }
}
