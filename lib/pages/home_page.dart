import 'package:flutter/material.dart';
import 'package:travesia_colombia2022/Screens/favoritos_screen.dart';
import 'package:travesia_colombia2022/Screens/todos_screen.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text("Sitios Turisticos Leticia",style: TextStyle(color: Colors.white ,fontSize: 24,fontWeight: FontWeight.bold)),
          bottom: const TabBar(
              tabs:
              [
                Tab(child: Text("TODOS",style: TextStyle(fontSize: 16))),
                Tab(child: Text("FAVORITOS",style: TextStyle(fontSize: 16)))
              ]
          ),
        ),
        body: const TabBarView(
            children: <Widget>[
              TodosScreen(),
              FavoritosScreen()
            ]
        ),
      ),
    );
  }
}
