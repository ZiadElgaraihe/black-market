part of 'ingots_coins_model.dart';

class CompanyDataModel {
  int id;
  int companyId;
  int workmanship;
  double tax;
  int returnFees;

  CompanyDataModel({
    required this.id,
    required this.companyId,
    required this.workmanship,
    required this.tax,
    required this.returnFees,
  });

  factory CompanyDataModel.fromJson({required Map<String, dynamic> data}) {
    return CompanyDataModel(
      id: data['id'],
      companyId: data['company_id'],
      workmanship: data['workmanship'].toInt(),
      tax: (data['tax'] is int) ? data['tax'].toDouble() : data['tax'],
      returnFees: data['return_fees'].toInt(),
    );
  }
}
