import 'package:flutter/material.dart';

class TuristicoPOIPage extends StatelessWidget {
  TuristicoPOIPage({Key? key}) : super(key: key);

  var ciudad = "Cartagena";
  var depa = "Bolivar";
  var temp = "28ºC";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Detalles de Travesia Colombia"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Travesia Colombia", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20,),
            const Image(image: AssetImage("assets/images/img.png"), width: 200,height: 200,),
            const SizedBox(height: 25,),

            Column(
              children: [
                Text("Ciudad: ${ciudad}"),
                Text("Ciudad: ${depa}"),
                Text("Ciudad: ${temp}")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
