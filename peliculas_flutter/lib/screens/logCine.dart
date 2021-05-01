import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:peliculas_flutter/widgets/basedWidgets.dart';
import 'package:peliculas_flutter/helpers/constantes.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:peliculas_flutter/screens/logUser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LogCine extends StatefulWidget {
  @override
  _LogCineState createState() => _LogCineState();
}

class _LogCineState extends State<LogCine> {
  @override
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return kBasedLoginWidget('Log Cine', context, onClick);
  }
}

void onClick(context, email, password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    final mAuth = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (mAuth != null) {
      String uid = mAuth.user.uid;
      String url = 'http://localhost:8080/cinemas/search/findByUid?uid=${uid}';
      Uri link = Uri.parse(url);
      var respuesta = await http.get(
        link,
        headers: {'Content-Type': 'application/json'},
      );

      respuesta.statusCode < 400
          ? Fluttertoast.showToast(
              msg: 'Bienvenido Cinema',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              fontSize: 16.0)
          : print(respuesta.statusCode);

      respuesta.statusCode < 400
          ? Navigator.pushNamed(context, mainScreenCine)
          : print(respuesta.statusCode);
    }
  } catch (e) {
    print(e);
  }
}
