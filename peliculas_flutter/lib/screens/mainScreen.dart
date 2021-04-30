import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:peliculas_flutter/helpers/constantes.dart';
import '../widgets/expanded_text_button.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
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
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          margin: EdgeInsets.all(100),
          child: Center(
            child: Column(
              children: <Widget>[
                ExpandedTextButton(
                    fn: () {
                      Navigator.pushNamed(context, noRegUsScreen);
                    },
                    title: 'Ver los titulos disponibles'),
                ExpandedTextButton(
                    fn: () {
                      Navigator.pushNamed(context, regUser);
                    },
                    title: 'Registrate'),
                ExpandedTextButton(
                    fn: () {
                      Navigator.pushNamed(context, logUser);
                    },
                    title: 'Entrar'),
                ExpandedTextButton(
                    fn: () {
                      Navigator.pushNamed(context, logCine);
                    },
                    title: 'Entrar como cine'),
                ExpandedTextButton(
                    fn: () {
                      Navigator.pushNamed(context, logAdmin);
                    },
                    title: 'Entrar como administrador'),
              ],
            ),
          )),
    );
  }
}
