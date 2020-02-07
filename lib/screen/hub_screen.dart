import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uds_app/screen/criar_pauta_screen.dart';
import 'package:uds_app/screen/pautas_screen.dart';
import 'package:uds_app/screen/profile_screen.dart';

class HubScreen extends StatefulWidget {
  @override
  _HubScreenState createState() => _HubScreenState();
}

class _HubScreenState extends State<HubScreen> {

  int _selectedPage = 0;
  final _pageOptions = [
    PautasScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index){
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Inicio')
            ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text('Perfil')
            ),
        ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: new FloatingActionButton(
          child: Icon(CupertinoIcons.add,size: 40,),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context)=>CriarPautaScreen(null)));
          }
          )
          );
  }
}
