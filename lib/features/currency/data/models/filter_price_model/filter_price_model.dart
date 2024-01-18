class FilterPriceModel {
  int currencyId;
  double price;
  String date;

  FilterPriceModel({
    required this.currencyId,
    required this.price,
    required this.date,
  });

  factory FilterPriceModel.fromJson({required Map<String, dynamic> data}) {
    return FilterPriceModel(
      currencyId: data['currency_id'],
      price: (data['price'] is int)
          ? data['price'].toDouble()
          : data['price'],
      date: data['date'],
    );
  }
}
