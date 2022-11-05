import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travesia_colombia2022/model/todos_model.dart';
import 'package:travesia_colombia2022/pages/turistico_poi.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream:  FirebaseFirestore.instance.collection('Lugares').snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return const Center(child: Text("Cargando", style: TextStyle(fontSize: 18),));
        }else{
          return ListView.builder(

              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                QueryDocumentSnapshot lugares = snapshot.data!.docs[index];
                return Column(
                  children: <Widget> [
                    TextButton(
                        style: const ButtonStyle(),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TuristicoPOIPage()));
                        },
                        child: Column(
                          children: [

                            ListTile(
                                leading: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    backgroundImage: NetworkImage(lugares['foto'])),
                                title: Text(lugares['titulo'], style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                subtitle: Container(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(lugares['descripcion'], style: const TextStyle(color: Colors.grey, fontSize: 15.0),overflow: TextOverflow.ellipsis, maxLines: 2),
                                )
                            ),

                          ],
                        )),
                    const Divider(height: 1,),
                  ],
                );
              }
          );
        }
      },
    );
  }
}