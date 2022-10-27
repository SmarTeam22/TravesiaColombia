import 'package:flutter/material.dart';

class TuristicoPOIPage extends StatelessWidget {
  TuristicoPOIPage({Key? key}) : super(key: key);

  var ciudad = "Cartagena";
  var depa = "Bolivar";
  var temp = "28ºC";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles de Travesia Colombia"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  child: Column(
                children: const [
                  Text("Travesia Colombia",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 30,
                  ),
                  Image(
                    image: AssetImage("assets/images/img.png"),
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                ],
              )),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ciudad: ${ciudad}", style: TextStyle(fontSize: 16)),
                    Text("Ciudad: ${depa}", style: TextStyle(fontSize: 16)),
                    Text("Ciudad: ${temp}", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 15,),
                    Text("Descripción del sitio Turistico a investigar", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 15,),
                    Text("Otra información de interes.", style: TextStyle(fontSize: 16))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
