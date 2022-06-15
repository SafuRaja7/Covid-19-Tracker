// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CovidAdapter extends TypeAdapter<Covid> {
  @override
  final int typeId = 0;

  @override
  Covid read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Covid(
      cases: fields[0] as int?,
      deaths: fields[1] as int?,
      recovered: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Covid obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.cases)
      ..writeByte(1)
      ..write(obj.deaths)
      ..writeByte(2)
      ..write(obj.recovered);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CovidAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
