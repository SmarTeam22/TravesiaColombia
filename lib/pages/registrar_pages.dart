import 'package:flutter/material.dart';

class RegistrarPage extends StatefulWidget {
  const RegistrarPage({Key? key}) : super(key: key);

  @override
  State<RegistrarPage> createState() => _RegistrarPageState();
}

class _RegistrarPageState extends State<RegistrarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
          child: Center(
            //'SingleChildScrollView' Para que no aparezca el cuadro amarillo con rayas
            child: Column(
              children: [
                const Image(image: AssetImage("assets/images/logo.png"), width: 120, height: 120),
                const SizedBox(height: 20),

                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 20),

                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Contraseña",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.key),
                  ),
                ),
                const SizedBox(height: 20),

                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Confirmar Contraseña",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.key),
                  ),
                ),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Registrar", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
