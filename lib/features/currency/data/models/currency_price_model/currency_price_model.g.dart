// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_price_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyPriceModelAdapter extends TypeAdapter<CurrencyPriceModel> {
  @override
  final int typeId = 2;

  @override
  CurrencyPriceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyPriceModel(
      id: fields[0] as int,
      bankId: fields[1] as int?,
      price: fields[2] as double?,
      buyPrice: fields[3] as double?,
      sellPrice: fields[4] as double?,
      updatedAt: fields[5] as String,
    )..bankName = fields[6] as String?;
  }

  @override
  void write(BinaryWriter writer, CurrencyPriceModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.bankId)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.buyPrice)
      ..writeByte(4)
      ..write(obj.sellPrice)
      ..writeByte(5)
      ..write(obj.updatedAt)
      ..writeByte(6)
      ..write(obj.bankName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyPriceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
