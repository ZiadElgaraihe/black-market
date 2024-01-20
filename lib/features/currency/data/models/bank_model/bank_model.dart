class BankModel {
  int id;
  String name;
  String image;
  String shortName;

  BankModel({
    required this.id,
    required this.name,
    required this.image,
    required this.shortName,
  });

  factory BankModel.fromJson({required Map<String, dynamic> data}) {
    return BankModel(
      id: data['id'],
      name: data['name'],
      image: 'http://www.voipsys.space/storage/${data['icon']}',
      shortName: data['shortname'],
    );
  }
}
