import 'package:flutter/material.dart';
import 'package:travesia_colombia2022/pages/login_page.dart';
import 'package:travesia_colombia2022/repositorio/usuario_registrar.dart';

class RegistrarPage extends StatefulWidget {
  const RegistrarPage({Key? key}) : super(key: key);

  @override
  State<RegistrarPage> createState() => _RegistrarPageState();
}

class _RegistrarPageState extends State<RegistrarPage> {
  final email=TextEditingController();
  final password=TextEditingController();
  final confirPassword=TextEditingController();
  Usuario_Registrar usuario = Usuario_Registrar();
  late final mensaje msj;

  void guardarUsuario() async{
    var resul = await usuario.registrarUsuario(email.text, password.text);

    if(resul=="invalid-email"){
      msj.mostrarMensaje("Formato de email incorrecto");
    }else if(resul=="weak-password"){
      msj.mostrarMensaje("La contraseña debe tener mínimo 6 caracteres");
    }else if(resul=="unknown"){
      msj.mostrarMensaje("Por favor llenar los campos vacíos");
    }else if(resul=="network-request-failed"){
      msj.mostrarMensaje("Revisar conexión a internet");
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
      msj.mostrarMensaje("Usuario registrado correctamente!");
    }
  }

  @override
  Widget build(BuildContext context) {
    msj=mensaje(context);

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
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Contraseña",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.key),
                  ),
                ),
                const SizedBox(height: 20),

                TextFormField(
                  controller: confirPassword ,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Confirmar Contraseña",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.key),
                  ),
                ),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    guardarUsuario();
                  },
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
