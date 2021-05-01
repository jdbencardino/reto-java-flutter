import 'package:flutter/cupertino.dart';
import 'package:peliculas_flutter/widgets/basedWidgets.dart';
import 'package:peliculas_flutter/helpers/constantes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

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
      String uid = mAuth.user.uid;
      String url = 'http://localhost:8080/admins/search/findByUid?uid=${uid}';
      Uri link = Uri.parse(url);
      var respuesta = await http.get(
        link,
        headers: {'Content-Type': 'application/json'},
      );

      respuesta.statusCode < 400
          ? Fluttertoast.showToast(
              msg: 'Bienvenido Admin',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              fontSize: 16.0)
          : print(respuesta.statusCode);

      respuesta.statusCode < 400
          ? Navigator.pushNamed(context, mainScreenAdmin)
          : print(respuesta.statusCode);
    }
  } catch (e) {
    print(e);
  }
}
