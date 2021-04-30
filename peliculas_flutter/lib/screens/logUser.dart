import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:peliculas_flutter/widgets/basedWidgets.dart';
import 'package:peliculas_flutter/helpers/constantes.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class LogUser extends StatefulWidget {
  @override
  _LogUserState createState() => _LogUserState();
}

class _LogUserState extends State<LogUser> {
  @override
  Widget build(BuildContext context) {
    return kBasedLoginWidget('Log User', context, onClickLog);
  }
}

Future<void> onClickLog(context, email, password) async {
  FirebaseAuth _auth = await FirebaseAuth.instance;

  try {
    final mAuth = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    continueWithLogin(mAuth, context);
  } catch (e) {
    print(e);
  }
}

void continueWithLogin(mAuth, context) async {
  if (mAuth != null) {
    String uid = mAuth.currentUser.uid;
    String url = 'http://localhost:8080/users/search/findByUid?uid=${uid}';
    Uri link = Uri.parse(url);
    var respuesta = await http.get(
      link,
      headers: {'Content-Type': 'application/json'},
    );

    String id = jsonDecode(respuesta.body)['_embedded']['subscribers'][0]['id']
        .toString();
    String username =
        jsonDecode(respuesta.body)['_embedded']['subscribers'][0]['username'];
    String name =
        jsonDecode(respuesta.body)['_embedded']['subscribers'][0]['name'];
    String surname =
        jsonDecode(respuesta.body)['_embedded']['subscribers'][0]['surname'];
    String email =
        jsonDecode(respuesta.body)['_embedded']['subscribers'][0]['email'];
    String points =
        jsonDecode(respuesta.body)['_embedded']['subscribers'][0]['points'];

    Navigator.pushNamed(context, mainScreenSub);
  }
}
