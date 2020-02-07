import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class UserModel extends Model {

  FirebaseAuth _auth = FirebaseAuth.instance;
  Firestore _db = Firestore.instance;
  DocumentSnapshot snapshot;

  FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map();

  static UserModel of(BuildContext context) =>
      ScopedModel.of<UserModel>(context);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    _loadCurrentUser();
  }


  void addPauta(String title, String subtitle, String description, String autor) async{
    _db.collection('pautas').document('abertas').collection('abertas').add({
      'title':title,
      'subtitle':subtitle,
      'description':description,
      'autor': autor
    });
  }

  void deletePauta(DocumentReference reference)async{
    _db.collection('pautas').document('fechadas').collection('fechadas').document(reference.documentID).delete();
  }

  
  void addPauta1(String title, String subtitle, String description, String autor) async{
    _db.collection('pautas').document('fechadas').collection('fechadas').add({
      'title':title,
      'subtitle':subtitle,
      'description':description,
      'autor': autor
    });
  }

  void deletePauta1(DocumentReference reference)async{
    _db.collection('pautas').document('abertas').collection('abertas').document(reference.documentID).delete();
  }

  void signUp({@required Map<String, dynamic> userData, @required String pass,
      @required VoidCallback onFail}){

    notifyListeners();

    

    _auth.createUserWithEmailAndPassword(
        email: userData["email"],
        password: pass
    ).then((user) async {
      firebaseUser = user;
      verifyEmail(userData['email']);
      await _saveUserData(userData);

      notifyListeners();
    }).catchError((e){
      print(e.hashCode);
      onFail();
      notifyListeners();
    });

  }

  Future<Null> verifyEmail(String email)async{
    FirebaseUser user = await _auth.currentUser();
    await user.reload();
    user = await _auth.currentUser();
    bool flag = user.isEmailVerified;
  }

  Future<Null> verifyPass(String pass)async{
    _db.collection('user').document('pass').toString();
  }

  void signIn({@required String email, @required String pass,@required VoidCallback onFail}) async {

    notifyListeners();

    _auth.signInWithEmailAndPassword(email: email, password: pass).then(
      (user) async {
        firebaseUser = user;
    
        notifyListeners();

    }).catchError((e){
      notifyListeners();
    });

  }
  

   void signOut() async {
    await _auth.signOut();

    userData = Map();
    firebaseUser = null;

    notifyListeners();
  }

  void recoverPass(String email){
    _auth.sendPasswordResetEmail(email: email);
    
  }

  

  

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await Firestore.instance.collection("users").document(firebaseUser.uid).setData(userData);
  }

  Future<Null> _loadCurrentUser() async {
    if(firebaseUser == null)
      firebaseUser = await _auth.currentUser();
    if(firebaseUser != null){
      if(userData["name"] == null){
        DocumentSnapshot docUser =
          await Firestore.instance.collection("users").document(firebaseUser.uid).get();
        userData = docUser.data;
      }
    }
    notifyListeners();
  }

  
}