part 'ingots_model.dart';
part 'golden_coins_model.dart';
part 'company_data_model.dart';
part 'price_model.dart';

class IngotsCoinsModel {
  List<IngotsModel> ingots;
  List<GoldenCoinsModel> coins;

  IngotsCoinsModel({
    required this.ingots,
    required this.coins,
  });

  factory IngotsCoinsModel.fromJson({required Map<String, dynamic> data}) {
    return IngotsCoinsModel(
      ingots: List.generate(
        data['ingots'].length,
        (index) => IngotsModel.fromJson(
          data: data['ingots'][index],
        ),
      ),
      coins: List.generate(
        data['coins'].length,
        (index) => GoldenCoinsModel.fromJson(
          data: data['coins'][index],
        ),
      ),
    );
  }
}
