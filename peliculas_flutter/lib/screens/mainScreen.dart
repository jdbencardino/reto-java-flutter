import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_flutter/constantes.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return bodyLayout();
  }
}

class bodyLayout extends StatefulWidget {
  @override
  _bodyLayoutState createState() => _bodyLayoutState();
}

int cont = 0;

class _bodyLayoutState extends State<bodyLayout> {
  Expanded expandedTextButton(@required Function fn, @required String title) {
    return Expanded(
      child: Center(
        child: Container(
          height: 200,
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              fn();
            },
            child: Text('$title'),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return material();
  }

  Material material() {
    return Material(
      child: Center(
          child: Column(
        children: <Widget>[
          expandedTextButton(() {
            setState(() {
              Navigator.pushNamed(context, noRegUsScreen);
            });
          }, 'Entrada sin registro para usuarios'),
          Row(
            children: <Widget>[
              expandedTextButton(() {
                setState(() {
                  Navigator.pushNamed(context, regUser);
                });
              }, 'Registrarse como usuario'),
              expandedTextButton(() {
                setState(() {
                  Navigator.pushNamed(context, logUser);
                });
              }, 'Entrar como usuario')
            ],
          ),
          expandedTextButton(() {
            setState(() {
              Navigator.pushNamed(context, logCine);
              // todo reg
            });
          }, 'Entrada como cine'),
          expandedTextButton(() {
            setState(() {
              //httpUpdate();
              Navigator.pushNamed(context, logAdmin);
            });
          }, 'Entrada como administrador'),
        ],
      )),
    );
  }
}

void httpUpdate() async {
  String id = '1';
  Uri url = Uri.parse('http://localhost:8080/users/$id');
  var response = await http.patch(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(
      <Object, Object>{
        "username": "juan2",
      },
    ),
  );
  print(response.body);
}
