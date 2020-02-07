import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uds_app/tiles/pauta_aberta_tile.dart';

class PautasAbertasTab extends StatefulWidget {
  @override
  _PautasAbertasTabState createState() => _PautasAbertasTabState();
}

class _PautasAbertasTabState extends State<PautasAbertasTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection('pautas').document('abertas').collection('abertas').getDocuments(),
      builder: (context, snapshot){
        if(!snapshot.hasData)
          return Center(child: CircularProgressIndicator(),);
        else {
          return  Column(
            children: snapshot.data.documents.map(
              (doc){
                return PautaAbertaTile(doc);
              }
              ).toList(),
          );
        }
      }
      );
  }
}



