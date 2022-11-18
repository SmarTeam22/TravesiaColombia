
import 'package:cloud_firestore/cloud_firestore.dart';

class Star{
  String _id;
  String _address;
  String _name;
  GeoPoint _ubicacion;


  Star(this._id, this._address, this._name, this._ubicacion);


}