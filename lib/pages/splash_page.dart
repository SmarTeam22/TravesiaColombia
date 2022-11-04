import 'package:flutter/material.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  //FUNCIONES:
  void initState(){
    //Cuando inicie pantalla
   cambiarPage();
   super.initState();
  }

  Future<void> cambiarPage() async {
    Future.delayed(const Duration(seconds: 5), () async{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage() ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xCFB6E1C3),
      body: Center(
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/fondo.png'),
        radius: 270,
        backgroundColor: Colors.transparent,
      ),  
      ),
    );
   
     /* backgroundColor: Colors.white,
        body: Center(
          child: Image(image: AssetImage("assets/images/travesia.png"), width: 300, height: 300,),
        )*/
  }
}