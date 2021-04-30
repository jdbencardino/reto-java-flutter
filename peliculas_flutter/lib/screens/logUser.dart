import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:peliculas_flutter/baseWidgets/basedWidgets.dart';
import 'package:peliculas_flutter/constantes.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

class LogUser extends StatefulWidget {
  @override
  _LogUserState createState() => _LogUserState();
}

class _LogUserState extends State<LogUser> {
  @override
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return kBasedLoginWidget('Log User', context, onClickLog);
  }
}

void onClickLog(context, email, password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    final mAuth = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (mAuth != null) {
      String url = 'http://localhost:8080/users';
      Uri link = Uri.parse(url);
      var respuesta = await http.get(
        link,
        headers: {'Content-Type': 'application/json'},
      );

      final prefs = await SharedPreferences.getInstance();
      prefs.setString(userName, _auth.currentUser.displayName);
      prefs.setString(userEmail, _auth.currentUser.email);
      prefs.setString(userId, _auth.currentUser.uid);
      prefs.setString(userAccessLevel, 'Suscriptor');
      print(jsonDecode(respuesta.body));
      Navigator.pushNamed(context, mainScreenInside);
    }
  } catch (e) {
    print(e);
  }
}
