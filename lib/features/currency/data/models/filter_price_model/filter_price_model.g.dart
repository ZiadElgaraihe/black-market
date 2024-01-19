// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_price_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FilterPriceModelAdapter extends TypeAdapter<FilterPriceModel> {
  @override
  final int typeId = 3;

  @override
  FilterPriceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FilterPriceModel(
      price: fields[0] as double,
      date: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FilterPriceModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.price)
      ..writeByte(1)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilterPriceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
