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

    return ListView.builder(

      itemCount: temporalData.length,
      itemBuilder: (context,i) => Column(
        children: <Widget> [
          TextButton(
            style: ButtonStyle(),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TuristicoPOIPage()));
              },
              child: Column(
                children: [
                  ListTile(leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(temporalData[i].img,)),
                      title: Text(temporalData[i].lugar, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      subtitle: Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(temporalData[i].descripcion, style: TextStyle(color: Colors.grey, fontSize: 15.0),overflow: TextOverflow.ellipsis),
                      )
                  ),

                ],
              )),
          const Divider(height: 1,),
        ],
      )
    );
  }
}