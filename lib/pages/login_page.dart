
import 'package:flutter/material.dart';
import 'package:travesia_colombia2022/pages/home_page.dart';
import 'package:travesia_colombia2022/pages/turistico_poi.dart';
import 'package:travesia_colombia2022/pages/registrar_pages.dart';


class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final email = TextEditingController();
  final password = TextEditingController();

  void mostrarMensaje(String mensaje){
    final pantalla=ScaffoldMessenger.of(context);
    pantalla.showSnackBar(
        SnackBar(
          content: Text(mensaje, style: const TextStyle(color: Colors.black,fontStyle: FontStyle.italic,fontSize: 20,),),
          backgroundColor: Colors.cyan,
          duration: const Duration(seconds: 5),
        )
    );
  }
  void validacionUsuario(){
    if(email.text.isNotEmpty && password.text.isNotEmpty){
      if(email.text=="ejemplo@gmail.com"){
        if(password.text=='123'){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const RegistrarPage()));
        }else{
          mostrarMensaje('Password incorrecto');
        }
      }else{
        mostrarMensaje('Usuario no Registrado');
      }
    }else{
      mostrarMensaje('Datos Obligatorios');
    }

  }


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
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: password,
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
                    validacionUsuario();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Ingresar", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrarPage()));
                  },
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