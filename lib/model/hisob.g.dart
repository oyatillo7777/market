// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hisob.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HisobAdapter extends TypeAdapter<Hisob> {
  @override
  final int typeId = 1;

  @override
  Hisob read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hisob(
      tovar: fields[0] as Tovar,
      soni: fields[1] as int,
      foyda: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Hisob obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.tovar)
      ..writeByte(1)
      ..write(obj.soni)
      ..writeByte(2)
      ..write(obj.foyda);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HisobAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
