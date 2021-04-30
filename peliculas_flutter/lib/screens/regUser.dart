import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:peliculas_flutter/baseWidgets/basedWidgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_flutter/constantes.dart';
import 'package:peliculas_flutter/screens/logUser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegUser extends StatefulWidget {
  @override
  _RegUserState createState() => _RegUserState();
}

class _RegUserState extends State<RegUser> {
  @override
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return kBasedRegisterWidget('Reg User', context, onClick);
  }
}

void onClick(context, username, name, surname, email, password) async {
  Firebase.initializeApp();
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    final newUSer = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (newUSer != null) {
      try {
        String url = 'http://localhost:8080/users';
        Uri link = Uri.parse(url);
        String uid = newUSer.user.uid;
        print('$username | $name | $surname | $email | $password | $uid ');
        var respuesta = await http.post(
          link,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "username": "$username",
            "uid": uid,
            "name": "$name",
            "surname": "$surname",
            "email": "$email"
          }),
        );

        respuesta.statusCode < 400
            ? onClickLog(context, email, password)
            : print('Error + ${respuesta.statusCode}');
      } catch (e) {
        print(e);
      }
    } else {}
  } catch (e) {
    print(e);
  }
}
