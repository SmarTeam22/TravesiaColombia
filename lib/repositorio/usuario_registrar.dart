import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/usuario_model.dart';

class Usuario_Registrar{
  Future<String?> registrarUsuario(String email, String password) async {
    try{
      final credencial = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return credencial.user?.uid;
    }on FirebaseAuthException catch(e){
      return e.code;
    }on FirebaseException catch (e){
      return e.code;
    }

  }


  Future<String?> crearUsuario(Usuario usuario) async {

    try{
      var documento = await FirebaseFirestore.instance.collection("Usuarios").doc(usuario.id).set(usuario.convertir()); //línea para guardar en la base de datos
      return usuario.id;
    }on FirebaseException catch(e){
      return e.code;
    }

  }

}