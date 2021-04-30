import 'package:flutter/cupertino.dart';
import 'package:peliculas_flutter/widgets/basedWidgets.dart';
import 'package:peliculas_flutter/helpers/constantes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

class LogAdmin extends StatefulWidget {
  @override
  _LogAdminState createState() => _LogAdminState();
}

class _LogAdminState extends State<LogAdmin> {
  @override
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return kBasedLoginWidget('Log admin', context, onClick);
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
      prefs.setString('accesLevel', 'Administrador');
      Navigator.pushNamed(context, mainScreenAdmin);
    }
  } catch (e) {
    print(e);
  }
}
