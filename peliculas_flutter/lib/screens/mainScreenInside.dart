import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peliculas_flutter/itemsScreen/itemsUser.dart';
import 'noRegUsScreen.dart';
import 'package:peliculas_flutter/itemsScreen/user.dart';
import 'package:peliculas_flutter/constantes.dart';
import 'package:peliculas_flutter/baseWidgets/basedWidgets.dart';

String mainTitle = 'Principal';

class MainScreenInside extends StatefulWidget {
  @override
  _MainScreenInsideState createState() => _MainScreenInsideState();
}

class _MainScreenInsideState extends State<MainScreenInside> {
  int _pos = 0;
  String title = 'Principal';

  @override
  Widget build(BuildContext context) {
    return willPopScope();
  }

  Widget willPopScope() {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        SystemNavigator.pop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(mainTitle),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('username'),
                accountEmail: Text('access'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    'U',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              listTitle(Icons.search, 'Buscar peliculas', () {
                setState(() {
                  mainTitle = 'Peliculas disponibles';
                  _pos = 1;
                  Navigator.of(context).pop();
                });
              }),
              listTitle(Icons.person, 'Mi perfil', () {
                setState(() {
                  mainTitle = 'Mi perfil';
                  _pos = 2;
                  Navigator.of(context).pop();
                });
              }),
              listTitle(Icons.home_rounded, 'Salir', () {
                setState(() {
                  _pos = 3;
                  Navigator.of(context).pop();
                });
              }),
              listTitle(Icons.announcement_outlined, 'Acerca de la app', () {
                setState(() {
                  mainTitle = 'Acerca de la App';
                  _pos = 4;
                  Navigator.of(context).pop();
                });
              }),
            ],
          ),
        ),
        body: _getWidgetItemSelected(_pos),
      ),
    );
  }
}

Widget _getWidgetItemSelected(int pos) {
  switch (pos) {
    case 0:
      return Container();
    case 1:
      return BodyLayout();
    case 2:
      return MiPerfil();
    case 3:
      return Container();
    case 4:
      return Container();
    default:
      return Container();
  }
}

Future<Suscriber> getCompleteUser(uid) async {}
