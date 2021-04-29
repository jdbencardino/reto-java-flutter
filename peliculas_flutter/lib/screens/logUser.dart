import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:peliculas_flutter/baseWidgets/basedWidgets.dart';
import 'package:peliculas_flutter/constantes.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class LogUser extends StatefulWidget {
  @override
  _LogUserState createState() => _LogUserState();
}

class _LogUserState extends State<LogUser> {
  @override
  Widget build(BuildContext context) {
    return basedLoginWidget('Log User', context, onClick);
  }
}

void onClick(context, email, password) async {
  //Firebase.initializeApp();
  FirebaseAuth _auth = FirebaseAuth.instance;

  if (await _auth.currentUser != null) {
    print(await _auth.currentUser.getIdTokenResult());
  } else {
    print('pailas');
  }

  try {
    final mAuth = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (mAuth != null) {
      //Navigator.pushNamed(context, ChatScreen.id);
      print('usuario logueado');
    }
  } catch (e) {
    print(e);
  }

  print('felicidades');

  try {
    String url2 = 'http://localhost/logUser$email#$password';
    String url =
        'http://localhost:8080/users/search/findByUsernameAndPassword?username=$email&password=$password';
    Uri link = Uri.parse(url);
    var respuesta = await http.get(link);
    // var users = jsonDecode(respuesta.body)['_embedded']['users'] as Map<String, dynamic>;

    if (jsonDecode(respuesta.body)['_embedded']['users'].length != 0) {
      //print('YEIII');
      Navigator.pushNamed(context, mainScreenInside);
    } else {
      //print('Ohh nooooo');
    }
  } catch (e) {
    print(e);
  }
}
