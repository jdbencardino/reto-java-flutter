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
    String url = 'http://localhost/logUser$username#$password';
    Uri link = Uri.parse(url_get_movies);
    var respuesta = await http.get(link);
    print(respuesta.statusCode);
  } catch (e) {
    print(e);
  }
}
