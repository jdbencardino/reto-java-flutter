import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:peliculas_flutter/widgets/basedWidgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_flutter/helpers/constantes.dart';
import 'package:peliculas_flutter/screens/logUser.dart';
import 'package:shared_preferences/shared_preferences.dart';

BuildContext _context;

class RegUser extends StatefulWidget {
  @override
  _RegUserState createState() => _RegUserState();
}

class _RegUserState extends State<RegUser> {
  @override
  Widget build(BuildContext context) {
    _context = context;
    return kBasedRegisterWidget('Reg User', context, onClick);
  }
}

void onClick(context, username, name, surname, email, password) async {
  context = _context;
  await Firebase.initializeApp();
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    final newUSer = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (newUSer != null) {
      String url = 'http://localhost:8080/subscribers';
      Uri link = Uri.parse(url);
      String uid = newUSer.user.uid;
      print('$username | $name | $surname | $email | $password | $uid ');
      var respuesta = await http.post(
        link,
        headers: {'content-Type': 'application/json'},
        body: jsonEncode({
          "username": "$username",
          "uid": uid,
          "email": email,
          "name": "$name",
          "surname": "$surname",
          "points": "0"
        }),
      );

      if (respuesta.statusCode < 400) {
        Navigator.pushNamed(context, mainScreenSub);
      } else {
        print('Error + ${respuesta.statusCode}');
      }
    }
  } catch (e) {
    print(e);
  }
}
