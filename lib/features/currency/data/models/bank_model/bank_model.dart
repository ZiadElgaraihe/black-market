class BankModel {
  int id;
  String name;
  String icon;
  String shortName;

  BankModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.shortName,
  });

  factory BankModel.fromJson({required Map<String, dynamic> data}) {
    return BankModel(
      id: data['id'],
      name: data['name'],
      icon: data['icon'],
      shortName: data['shortname'],
    );
  }
}
