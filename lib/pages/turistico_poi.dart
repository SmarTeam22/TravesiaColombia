import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TuristicoPOIPage extends StatelessWidget {

  late final String _titulo;
  late final String _foto;
  late final double _calificacion;
  late final String _descripcion;


  String get titulo => _titulo;

  String get foto => _foto;

  double get calificacion => _calificacion;

  String get descripcion => _descripcion;

  TuristicoPOIPage(this._foto, this._titulo, this._calificacion,
      this._descripcion, {Key? key}) : super(key: key);

  var ciudad = "Leticia";
  var depa = "Bolivar";
  var temp = "28ºC";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Lugares').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: Text("Cargando",
                  style: TextStyle(fontSize: 18, color: Colors.black),));
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Detalles"),
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
                              Text(descripcion, textAlign: TextAlign.justify)
                            ],
                          )
                      ),

                    ],
                  ),
                ),
              ),
            );
          }
        }
    );
  }
}