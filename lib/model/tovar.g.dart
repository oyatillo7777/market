// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tovar.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TovarAdapter extends TypeAdapter<Tovar> {
  @override
  final int typeId = 0;

  @override
  Tovar read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tovar(
      nomi: fields[0] as String,
      narxi: fields[1] as double,
      TanNarxi: fields[2] as double,
      soni: fields[3] as int,
      image: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Tovar obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.nomi)
      ..writeByte(1)
      ..write(obj.narxi)
      ..writeByte(2)
      ..write(obj.TanNarxi)
      ..writeByte(3)
      ..write(obj.soni)
      ..writeByte(4)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TovarAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
