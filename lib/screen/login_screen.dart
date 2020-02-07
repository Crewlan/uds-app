import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uds_app/Animation/FadeAnimation.dart';
import 'package:uds_app/models/user_model.dart';
import 'package:uds_app/screen/cadastro_screen.dart';
import 'package:uds_app/screen/hub_screen.dart';
import 'package:uds_app/screen/recuperar_senha_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body:
            ScopedModelDescendant<UserModel>(builder: (context, child, model) {
          return ListView(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 350,
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
                                  margin: EdgeInsets.only(top: 90),
                                  child: Center(
                                    child: Text(
                                      "Login",
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
                        padding: EdgeInsets.all(20.0),
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
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller: _emailController,
                                          validator: (text) {
                                            if (text.isEmpty ||
                                                !text.contains("@") ||
                                                !text.contains('.com'))
                                              return "Email vazio ou invalido";
                                          },
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Email",
                                              hintStyle: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 15,
                                                  color: Colors.grey[600])),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: _passController,
                                          validator: (text) {
                                            if (text.isEmpty)
                                              return "Senha vazia ou invalida";
                                            if (text.length > 10)
                                              return "Senha passou de 10 caracteres";
                                          },
                                          obscureText: true,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Senha",
                                              hintStyle: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 15,
                                                  color: Colors.grey[600])),
                                        ),
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
                                              Color.fromRGBO(143, 148, 251, 1),
                                              Color.fromRGBO(143, 148, 251, .6),
                                            ])),
                                        child: Center(
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      model.signIn(
                                          email: _emailController.text,
                                          pass: _passController.text,
                                          onFail: _onFail);
                                          _onSuccess();
                                      model.verifyEmail(_emailController.text);
                                      model.verifyPass(_passController.text);
                                    } else {
                                      _onFail();
                                    }
                                  }),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            GestureDetector(
                              child:FadeAnimation(
                                1.5,
                                Text(
                                  "Esqueceu sua senha?",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 20,
                                      color: Color.fromRGBO(143, 148, 251, 1)),
                                )),
                                onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => RecuperarSenha()));
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              child: FadeAnimation(
                                  1.5,
                                  Text(
                                    "Criar Conta",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Montserrat',
                                        color:
                                            Color.fromRGBO(143, 148, 251, 1)),
                                  )),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CadastroScreen()));
                              },
                            )
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

  void _onSuccess() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HubScreen()),
        ModalRoute.withName('/login_screen'));
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao Entrar!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
}
