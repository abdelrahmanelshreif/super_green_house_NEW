// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planet_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlanetDataModelAdapter extends TypeAdapter<PlanetDataModel> {
  @override
  final int typeId = 0;

  @override
  PlanetDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlanetDataModel(
      planetName: fields[0] as String,
      planetFeatures: (fields[1] as List).cast<String>(),
      planetDesc: fields[2] as String,
      planetKingdom: fields[3] as String,
      planetFamily: fields[4] as String,
      planetImgSrc: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PlanetDataModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.planetName)
      ..writeByte(1)
      ..write(obj.planetFeatures)
      ..writeByte(2)
      ..write(obj.planetDesc)
      ..writeByte(3)
      ..write(obj.planetKingdom)
      ..writeByte(4)
      ..write(obj.planetFamily)
      ..writeByte(5)
      ..write(obj.planetImgSrc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlanetDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
