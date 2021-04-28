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

void entrar() async {}
