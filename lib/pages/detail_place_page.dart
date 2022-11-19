import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailPlacePage extends StatefulWidget {

  late String _foto;
  late String _titulo;
  late double _latitud;
  late double _longitud;

  DetailPlacePage(this._foto, this._titulo,this._latitud, this._longitud, {Key? key}) : super(key: key);

  @override
  State<DetailPlacePage> createState() => _DetailPlacePageState();
}

class _DetailPlacePageState extends State<DetailPlacePage> {

  String get foto => widget._foto;
  String get titulo => widget._titulo;
  double get latitud => widget._latitud;
  double get longitud => widget._longitud;

  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = Set<Marker>();
  CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.terrain,
            initialCameraPosition: CameraPosition(
              target: LatLng(latitud, longitud),
              zoom: 15,
            ),
            markers: _markers,
            onTap: (position){
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position){
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) async {
              _customInfoWindowController.googleMapController = controller;
             // _controller.complete(controller);
              _showMarker();
            },
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 200,
            width: 200,
            offset: 50,
          )
        ],
      ),
    );
  }

  void _showMarker(){
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId(titulo),
            icon: BitmapDescriptor.defaultMarker,
            position: LatLng(latitud, longitud),
            //infoWindow: InfoWindow(title: titulo),
            onTap: (){
              _customInfoWindowController.addInfoWindow!(
               Container(
                 decoration: BoxDecoration(
                   color: Colors.white,
                   border: Border.all(color: Colors.grey),
                   borderRadius: BorderRadius.circular(10.0),
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.stretch,
                   children: [
                     Expanded(
                         child: Container(
                           decoration: BoxDecoration(
                             image: DecorationImage(
                               image: NetworkImage(foto),
                               fit: BoxFit.fitWidth,
                               filterQuality: FilterQuality.high
                             ),
                             borderRadius: const BorderRadius.only(
                               topLeft: Radius.circular(10.0),
                               topRight: Radius.circular(10.0),
                             ),
                             color: Colors.indigo,
                           ),
                         )
                     ),
                     Padding(padding: const EdgeInsets.all(8.0),
                     child: Text(titulo, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10.0),),
                     )
                   ],
                 ),
               ),
                LatLng(latitud, longitud)
              );
            }
        ),
      );
    });
  }

}

