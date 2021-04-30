import 'package:flutter/cupertino.dart';
import 'package:peliculas_flutter/widgets/basedWidgets.dart';
import 'package:peliculas_flutter/helpers/constantes.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:peliculas_flutter/screens/logUser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

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
  //Firebase.initializeApp();
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    final mAuth = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (mAuth != null) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('email', _auth.currentUser.email);
      prefs.setString('uid', _auth.currentUser.uid);
      prefs.setString('accesLevel', 'Cine');
      Navigator.pushNamed(context, mainScreenInside);
    }
  } catch (e) {
    print(e);
  }
}
