// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_lugares_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalLugaresAdapter extends TypeAdapter<LocalLugares> {
  @override
  final int typeId = 0;

  @override
  LocalLugares read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalLugares()
      ..foto = fields[0] as String?
      ..titulo = fields[1] as String?
      ..calificacion = fields[2] as double?
      ..descripcion = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, LocalLugares obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.foto)
      ..writeByte(1)
      ..write(obj.titulo)
      ..writeByte(2)
      ..write(obj.calificacion)
      ..writeByte(3)
      ..write(obj.descripcion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalLugaresAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
