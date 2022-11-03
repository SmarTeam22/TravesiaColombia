import 'package:flutter/material.dart';
import 'package:travesia_colombia2022/pages/home_page.dart';
import 'package:travesia_colombia2022/pages/registrar_pages.dart';
import 'package:travesia_colombia2022/pages/turistico_poi.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  FirebaseAuth auth=FirebaseAuth.instance;

  void mostrarMensaje(String mensaje) {
    final pantalla = ScaffoldMessenger.of(context);
    pantalla.showSnackBar(SnackBar(
      content: Text(
        mensaje,
        style: const TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.italic,
          fontSize: 20,
        ),
      ),
      backgroundColor: Colors.cyan,
      duration: const Duration(seconds: 5),
    ));
  }

  void validacionUsuario() async {
    try {
    final user = await auth.signInWithEmailAndPassword(email: email.text, password: password.text);
    if (user != null){
      mostrarMensaje("----BIENVENIDO-----");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
    }
  }on FirebaseAuthException catch(e){
      mostrarMensaje(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/fond.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 30),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          margin: const EdgeInsets.all(20),
                          child: const Image(image: AssetImage("assets/images/logo.png"), width: 160, height: 160,),
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.black,width: 4),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment(0.0, 1.0),
                              colors: <Color>[
                                Color(0xff3b7494),
                                Color(0xff26398a),
                                Color(0xff3b7494),
                              ],
                              tileMode: TileMode.repeated,
                            ),

                          ),
                        ),
                        const SizedBox(height: 40,),
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
                            child: Text(
                              "Ingresar",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Divider(color: Colors.grey,),

                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegistrarPage()));
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
            ),

        );
  }
}
