import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:peliculas_flutter/baseWidgets/basedWidgets.dart';
import 'package:peliculas_flutter/constantes.dart';
import 'package:http/http.dart' as http;

class LogUser extends StatefulWidget {
  @override
  _LogUserState createState() => _LogUserState();
}

class _LogUserState extends State<LogUser> {
  @override
  Widget build(BuildContext context) {
    return basedLoginWidget('Log User', context, entrar);
  }
}

void entrar() async {
  try {
    String url2 = 'http://localhost/logUser$username#$password';
    String url =
        'http://localhost:8080/users/search/findByUsernameAndPassword?username=$username&password=$password';
    Uri link = Uri.parse(url);
    var respuesta = await http.get(link);
    // var users = jsonDecode(respuesta.body)['_embedded']['users'] as Map<String, dynamic>;

    if (jsonDecode(respuesta.body)['_embedded']['users'].length != 0) {
      print('YEIII');
    } else {
      print('Ohh nooooo');
    }
  } catch (e) {
    print(e);
  }
}
