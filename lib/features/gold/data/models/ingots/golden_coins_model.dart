import 'package:black_market/features/gold/data/models/ingots/company_data_model.dart';
import 'package:black_market/features/gold/data/models/ingots/price_model.dart';

class GoldenCoinsModel {
  int id;
  String name;
  String karat;
  double weight;
  List<CompanyDataModel> companies;
  PriceModel price;

  GoldenCoinsModel({
    required this.id,
    required this.name,
    required this.karat,
    required this.weight,
    required this.companies,
    required this.price,
  });

  factory GoldenCoinsModel.fromJson({required Map<String, dynamic> data}) {
    return GoldenCoinsModel(
      id: data['id'],
      name: data['name'],
      karat: data['karat'],
      weight: data['weight'],
      companies: List.generate(
        data['companies_data'].length,
        (index) => CompanyDataModel.fromJson(
          data: data['companies_data'][index],
        ),
      ),
      price: PriceModel.fromJson(data: data['price']),
    );
  }
}
