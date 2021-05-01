import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_flutter/screens/logAdmin.dart';
import 'package:peliculas_flutter/widgets/basedWidgets.dart';
import 'package:peliculas_flutter/helpers/constantes.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LogUser extends StatefulWidget {
  @override
  _LogUserState createState() => _LogUserState();
}

class _LogUserState extends State<LogUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar como suscriptor'),
      ),
      body: kBasedLoginWidget('Log User', context, onClick),
    );
  }
}

void onClick(context, email, password) async {
  //Firebase.initializeApp();
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    final mAuth = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (mAuth != null) {
      String uid = mAuth.user.uid;
      String url =
          'http://localhost:8080/subscribers/search/findByUid?uid=${uid}';
      Uri link = Uri.parse(url);
      var respuesta = await http.get(
        link,
        headers: {'Content-Type': 'application/json'},
      );

      respuesta.statusCode < 400
          ? Fluttertoast.showToast(
              msg: 'Bienvenido Subscriber',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              fontSize: 16.0)
          : print(respuesta.statusCode);

      respuesta.statusCode < 400
          ? Navigator.pushNamed(context, mainScreenSub)
          : print(respuesta.statusCode);
    }
  } catch (e) {
    print(e);
  }
}

void continueWithLogin(mAuth, context) async {
  if (mAuth != null) {
    String uid = mAuth.currentUser.uid;
    String url =
        'http://localhost:8080/subscribers/search/findByUid?uid=${uid}';
    Uri link = Uri.parse(url);
    var respuesta = await http.get(
      link,
      headers: {'Content-Type': 'application/json'},
    );

    respuesta.statusCode < 400
        ? Fluttertoast.showToast(
            msg: 'Bienvenido Suscriptor', toastLength: Toast.LENGTH_SHORT)
        : print(respuesta.statusCode);

    respuesta.statusCode < 400
        ? Navigator.pushNamed(context, mainScreenSub)
        : print(respuesta.statusCode);
  }
}
