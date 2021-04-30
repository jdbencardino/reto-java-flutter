import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_flutter/constantes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:peliculas_flutter/screens/logUser.dart';
import 'package:peliculas_flutter/screens/noRegUsScreen.dart';

BuildContext _context;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('App'),
      ),
      body: bodyLayout(),
    );
  }
}

class bodyLayout extends StatefulWidget {
  @override
  _bodyLayoutState createState() => _bodyLayoutState();
}

class _bodyLayoutState extends State<bodyLayout> {
  Container expandedTextButton(@required Function fn, @required String title) {
    return Container(
      padding: EdgeInsets.all(5),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.blueAccent,
          onSurface: Colors.grey,
        ),
        onPressed: fn,
        child: Text(title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          margin: EdgeInsets.all(100),
          child: Center(
            child: Column(
              children: <Widget>[
                expandedTextButton(() {
                  Navigator.pushNamed(context, noRegUsScreen);
                }, 'Ver los titulos disponibles'),
                expandedTextButton(() {
                  Navigator.pushNamed(context, regUser);
                }, 'Registrate'),
                expandedTextButton(() {
                  Navigator.pushNamed(context, logUser);
                }, 'Entrar'),
                expandedTextButton(() {
                  Navigator.pushNamed(context, logCine);
                }, 'Entrar como cine'),
                expandedTextButton(() {
                  Navigator.pushNamed(context, logAdmin);
                }, 'Entrar como administrador'),
              ],
            ),
          )),
    );
  }
}
