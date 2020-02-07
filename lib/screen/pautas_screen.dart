import 'package:flutter/material.dart';
import 'package:uds_app/tabs/pautas_abertas_tab.dart';
import 'package:uds_app/tabs/pautas_fechadas_tab.dart';

class PautasScreen extends StatefulWidget {
  @override
  _PautasScreenState createState() => _PautasScreenState();
}

class _PautasScreenState extends State<PautasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.purpleAccent[50],
            body: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index){
                return Column(
          children: <Widget>[
            Text('Pautas Abertas',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 30,
                    color: Colors.black)),
            PautasAbertasTab(),
            SizedBox(height: 110),
            Text('Pautas Fechadas',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 30,
                    color: Colors.black)),
            PautasFechadasTab(),
          ],
        ); 
              }
              )
            );
  }
}

