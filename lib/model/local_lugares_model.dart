import 'package:hive/hive.dart';

part 'local_lugares_model.g.dart'; //Adaptador Hive

@HiveType(typeId: 0)
class LocalLugares extends HiveObject{

  //PARÁMETROS:
  @HiveField(0)
  String? foto;
  @HiveField(1)
  String? titulo;
  @HiveField(2)
  double? calificacion;
  @HiveField(3)
  String? descripcion;
  @HiveField(4)
  double? latitud;
  @HiveField(5)
  double? longitud;



}