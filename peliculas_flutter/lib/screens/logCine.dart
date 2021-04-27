import 'package:flutter/cupertino.dart';
import 'package:peliculas_flutter/baseWidgets/basedWidgets.dart';
import 'package:peliculas_flutter/constantes.dart';
import 'package:http/http.dart' as http;

class LogCine extends StatefulWidget {
  @override
  _LogCineState createState() => _LogCineState();
}

class _LogCineState extends State<LogCine> {
  @override
  Widget build(BuildContext context) {
    return basedLoginWidget('Log Cine', context, entrar);
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
