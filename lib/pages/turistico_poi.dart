import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travesia_colombia2022/boxes.dart';
import 'package:travesia_colombia2022/model/local_lugares_model.dart';
import 'package:travesia_colombia2022/detail_place_page.dart';
import 'package:travesia_colombia2022/model/store.dart';
import 'package:travesia_colombia2022/pages/detail_place_page.dart';

class TuristicoPOIPage extends StatefulWidget {


  late final String _foto;
  late final String _titulo;
  late final double _calificacion;
  late final String _descripcion;
  late final double _latitud;
  late final double _longitud;


  TuristicoPOIPage(this._foto, this._titulo, this._calificacion,
      this._descripcion, this._latitud, this._longitud, {Key? key}) : super(key: key);

  @override
  State<TuristicoPOIPage> createState() => _TuristicoPOIPageState();
}

class _TuristicoPOIPageState extends State<TuristicoPOIPage> {

  String get titulo => widget._titulo;
  String get foto => widget._foto;
  double get calificacion => widget._calificacion;
  String get descripcion => widget._descripcion;
  double get latitud => widget._latitud;
  double get longitud => widget._longitud;

  var ciudad = "Leticia";

  var depa = "Bolivar";

  var temp = "28ºC";

  var isFavorite = false;

  QueryDocumentSnapshot<Object?>? get store => null;


  @override
  void initState() {
    _getLocalLugares();
    super.initState();
  }

  void _getLocalLugares() {
    final box = Boxes.getFavoriteBox();
    box.values.forEach((element) {
      if (element.titulo == titulo){
        isFavorite = true;
      }
    });
  }

  void _onFavoriteButton() async{
    var localLugares = LocalLugares()
        ..foto = foto
        ..titulo = titulo
        ..calificacion = calificacion
        ..descripcion = descripcion
        ..latitud = latitud
        ..longitud = longitud;

    final box = Boxes.getFavoriteBox();
   //box.add(localLugares);

    if (isFavorite){
      box.delete(localLugares.titulo);
    } else {
      box.put(localLugares.titulo, localLugares);
    }

    setState(() {
      isFavorite = !isFavorite;
    });

  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Lugares').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: Text("",
                  style: TextStyle(fontSize: 18, color: Colors.black),));
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Detalles"),
                actions: [
                  IconButton(
                      onPressed: (){
                        _onFavoriteButton();
                      },
                      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,size: 30,),
                    color: Colors.white,
                  )
                ],
                automaticallyImplyLeading: true,

              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            Text(titulo,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)
                            ),

                            const SizedBox(height: 30),

                            Image(image: NetworkImage(foto)),

                            const SizedBox(height: 35),
                          ],
                        ),
                      ),

                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.fmd_good_outlined,
                                      color: Colors.blueAccent),
                                  Text(ciudad),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Icon(Icons.star_border_purple500,
                                      color: Colors.amber),
                                  Text(
                                      "Puntuación: ${calificacion.toString()}"),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Text(descripcion, textAlign: TextAlign.justify),
                              const SizedBox(height: 60)
                            ],

                          ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // Standard IconButton
                                  children: const <Widget>[

                                  ]),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                  backgroundColor: const Color(0x13313130),
                  elevation: 0,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPlacePage(foto, titulo, latitud, longitud)));
                  },
                  child: const Image(
                      image: AssetImage("assets/images/pin.png"))),

            );
          }
        }
    );
  }
}
