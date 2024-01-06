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
            endPoint: 'https://voipsys.space/api/gold');
        List<GoldModel> golds = <GoldModel>[];

        for (var goldData in data) {
          golds.add(
            GoldModel.fromJson(data: goldData),
          );
        }

        return golds;
      },
    );
  }
}
