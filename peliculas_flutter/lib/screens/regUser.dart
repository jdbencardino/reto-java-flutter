import 'package:flutter/cupertino.dart';
import 'package:peliculas_flutter/baseWidgets/basedWidgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegUser extends StatefulWidget {
  @override
  _RegUserState createState() => _RegUserState();
}

class _RegUserState extends State<RegUser> {
  @override
  Widget build(BuildContext context) {
    return basedRegisterWidget('Reg User', context, onClick);
  }
}

void onClick(context, username, name, surname, email, password) {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String email, password;
  bool showSpinner = false;

  print('felicidades');
}
