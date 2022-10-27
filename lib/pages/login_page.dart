import 'package:flutter/material.dart';
import 'package:travesia_colombia2022/pages/turistico_poi.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  final email = "Correo@gmail.com";
  final password = "123";

  void validacionUsuario(){

  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
            child: Column(
              children: [
                const Image(
                  image: AssetImage("assets/images/logo.png"),
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 40),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true, //para que no se vea el password
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.key),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TuristicoPOIPage()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Ingresar", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Registrarse",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                          color: Color(0xFF2D3042))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}