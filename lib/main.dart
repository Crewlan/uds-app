import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uds_app/models/user_model.dart';
import 'package:uds_app/screen/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
       child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    )
    );
  }
}