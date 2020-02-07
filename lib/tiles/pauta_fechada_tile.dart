import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uds_app/models/user_model.dart';
import 'package:uds_app/screen/hub_screen.dart';

class PautaFechadaTile extends StatelessWidget {
  final DocumentSnapshot snapshot;
  PautaFechadaTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      return ExpansionTile(
        backgroundColor: Colors.green[100],
        trailing: Icon(
          CupertinoIcons.down_arrow,
          size: 50,
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(snapshot.data['title'],
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 30,
                          color: Colors.black)),
                  SizedBox(height: 5),
                  Divider(),
                  Text(snapshot.data['subtitle'],
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          color: Colors.black)),
                ],
              ),
            ),
          ],
        ),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(snapshot.data['description'],
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              color: Colors.black)),
                      SizedBox(height: 5),
                      Divider(),
                      Text(snapshot.data['autor'],
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 50,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(0, 204, 153, 1),
                      Color.fromRGBO(153, 255, 51, .6),
                    ])),
                child: Center(
                  child: Text(
                    "Reabrir Pauta",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              onPressed: () {
                model.addPauta(
                    snapshot.data['title'],
                    snapshot.data['subtitle'],
                    snapshot.data['description'],
                    snapshot.data['autor']);
                model.deletePauta(snapshot.reference);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HubScreen()),
                    ModalRoute.withName('/pauta_fechada_tile'));
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider()
        ],
      );
    });
  }
}
