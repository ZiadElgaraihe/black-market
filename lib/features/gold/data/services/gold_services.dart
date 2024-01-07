part of 'package:black_market/features/gold/data/repos/gold_repo.dart';

class GoldServices implements GoldRepo {
  GoldServices({required DioHelper dioHelper}) {
    _dioHelper = dioHelper;
  }

  late DioHelper _dioHelper;

  @override
  Future<Either<Failure, List<GoldModel>>> getGoldData() async {
    return await executeAndHandleErrors<List<GoldModel>>(
      () async {
        List<dynamic> data = await _dioHelper.getRequest(
          endPoint: 'https://voipsys.space/api/gold',
        );

        List<GoldModel> golds = <GoldModel>[];

        for (var goldData in data) {
          if (int.tryParse(goldData['karat']) == null) {
            continue;
          }
          golds.add(
            GoldModel.fromJson(data: goldData),
          );
        }

        return golds;
      },
    );
  }

  @override
  Future<Either<Failure, IngotsCoinsModel>> getIngotsCoinsData() async {
    return await executeAndHandleErrors<IngotsCoinsModel>(() async {
      Map<String, dynamic> data = await _dioHelper.getRequest(
        endPoint: 'https://voipsys.space/api/ingots-coins',
      );

      return IngotsCoinsModel.fromJson(data: data);
    });
  }
}
