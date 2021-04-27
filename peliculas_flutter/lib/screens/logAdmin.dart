import 'package:flutter/cupertino.dart';
import 'package:peliculas_flutter/baseWidgets/basedWidgets.dart';
import 'package:peliculas_flutter/constantes.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_flutter/screens/logCine.dart';

class LogAdmin extends StatefulWidget {
  @override
  _LogAdminState createState() => _LogAdminState();
}

class _LogAdminState extends State<LogAdmin> {
  @override
  Widget build(BuildContext context) {
    return basedLoginWidget('Log admin', context, entrar);
  }
}

void entrar() async {
  try {
    String url = 'http://localhost/logUser$username#$password';
    Uri link = Uri.parse(url_get_movies);
    var respuesta = await http.get(link);
    print(respuesta.statusCode);
  } catch (e) {
    print(e);
  }
}
