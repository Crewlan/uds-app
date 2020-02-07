import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uds_app/tiles/pauta_fechada_tile.dart';

class PautasFechadasTab extends StatefulWidget {
  @override
  _PautasFechadasTabState createState() => _PautasFechadasTabState();
}

class _PautasFechadasTabState extends State<PautasFechadasTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance
            .collection('pautas')
            .document('fechadas')
            .collection('fechadas')
            .getDocuments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            return Column(
              children: snapshot.data.documents.map((doc) {
                return PautaFechadaTile(doc);
              }).toList(),
            );
          }
        });
  }
}
