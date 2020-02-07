import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uds_app/Animation/FadeAnimation.dart';
import 'package:uds_app/models/user_model.dart';
import 'package:uds_app/screen/hub_screen.dart';

class CriarPautaScreen extends StatelessWidget {
  final _titleController = TextEditingController();
  final _subtitleController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final DocumentSnapshot snapshot;
  CriarPautaScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:
            ScopedModelDescendant<UserModel>(builder: (context, child, model) {
          return ListView(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/background.png'),
                              fit: BoxFit.fill)),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topCenter,
                            child: FadeAnimation(
                                1,
                                Container(
                                  height: 300,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/logo-branco.png'))),
                                )),
                          ),
                          Positioned(
                            child: FadeAnimation(
                                1.6,
                                Container(
                                  margin: EdgeInsets.only(top: 80),
                                  child: Center(
                                    child: Text(
                                      "Criar Pauta",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Column(
                          children: <Widget>[
                            FadeAnimation(
                                1.8,
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                143, 148, 251, .2),
                                            blurRadius: 20.0,
                                            offset: Offset(0, 10))
                                      ]),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[100]))),
                                        child: TextFormField(
                                          controller: _titleController,
                                          validator: (text) {
                                            if (text.isEmpty)
                                              return "Titulo vazio";
                                          },
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Digite o Titulo",
                                              hintStyle: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 15,
                                                  color: Colors.grey[600])),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[100]))),
                                        child: TextFormField(
                                          controller: _subtitleController,
                                          validator: (text) {
                                            if (text.isEmpty)
                                              return "Descrição vazia";
                                          },
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText:
                                                  "Digite uma breve descrição",
                                              hintStyle: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 15,
                                                  color: Colors.grey[600])),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[100]))),
                                        child: TextFormField(
                                          controller: _descriptionController,
                                          validator: (text) {
                                            if (text.isEmpty)
                                              return "Detalhes vazio";
                                          },
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Detalhes",
                                              hintStyle: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 15,
                                                  color: Colors.grey[600])),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                            'Autor: ${model.userData['name']}',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 15,
                                                color: Colors.black)),
                                      )
                                    ],
                                  ),
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            FadeAnimation(
                                1,
                                RaisedButton(
                                    padding: const EdgeInsets.all(0),
                                    textColor: Colors.transparent,
                                    child: FadeAnimation(
                                        1,
                                        Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                              gradient: LinearGradient(colors: [
                                                Color.fromRGBO(
                                                    143, 148, 251, 1),
                                                Color.fromRGBO(
                                                    143, 148, 251, .6),
                                              ])),
                                          child: Center(
                                            child: Text(
                                              "Criar Pauta",
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )),
                                    onPressed: () {
                                     if(_formKey.currentState.validate()){
                                        model.addPauta(
                                          _titleController.text,
                                          _subtitleController.text,
                                          _descriptionController.text,
                                          model.userData['name']);
                                          Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(builder: (context)=> HubScreen()), ModalRoute.withName('/criar_pauta_screen'));
                                     }
                                    })),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
