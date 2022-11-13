import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travesia_colombia2022/boxes.dart';
import 'package:travesia_colombia2022/model/local_lugares_model.dart';

import '../pages/turistico_poi.dart';

class FavoritosScreen extends StatefulWidget {
  const FavoritosScreen({Key? key}) : super(key: key);

  @override
  State<FavoritosScreen> createState() => _FavoritosScreenState();
}

class _FavoritosScreenState extends State<FavoritosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: _buildListView(),
        ),
      ),
    );
  }


  Widget _buildListView() {
    return ValueListenableBuilder<Box<LocalLugares>>(
        valueListenable: Boxes.getFavoriteBox().listenable(),
        builder: (context, box, _){
          final lugarBox = box.values.toList().cast<LocalLugares>();
          return ListView.builder(

              itemCount: lugarBox.length,
              itemBuilder: (context, index) {
                final lugar = lugarBox[index];
                return Column(
                  children: <Widget> [
                    TextButton(
                        style: const ButtonStyle(),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TuristicoPOIPage(lugar.foto!,lugar.titulo ?? "No title",lugar.calificacion!,lugar.descripcion!)));
                        },
                        child: Column(
                          children: [

                            ListTile(
                                leading: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    backgroundImage: NetworkImage(lugar.foto!)),
                                title: Text(lugar.titulo ?? "No title", style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                subtitle: Container(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(lugar.descripcion!, style: const TextStyle(color: Colors.grey, fontSize: 15.0),overflow: TextOverflow.ellipsis, maxLines: 2),
                                ),
                            ),

                          ],
                        )),
                    const Divider(height: 1,),
                  ],
                );
              }
          );
        }
    );
  }
}

