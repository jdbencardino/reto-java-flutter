import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peliculas_flutter/baseWidgets/basedWidgets.dart';
import 'package:peliculas_flutter/constantes.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_flutter/itemsScreen/itemsUser.dart';
import 'noRegUsScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:peliculas_flutter/brain.dart';

class MainScreenInside extends StatefulWidget {
  @override
  _MainScreenInsideState createState() => _MainScreenInsideState();
}

int _pos = 0;

//String _userName, _accessLevel, _id;

class _MainScreenInsideState extends State<MainScreenInside> {
  @override
  Widget build(BuildContext context) {
    //callDialog(userAccessLevel);
    //callDialog(userName);
    //callDialog(userId);
    return willPopScope();
  }

  /* Future<void> callDialog(key) async {
    await getIdFromShared(key).then((value) {
      switch (key) {
        case 'accessLevel':
          _accessLevel = value;
          break;
        case 'userName':
          _userName = value;
          break;
        case 'id':
          _id = value;
          break;
      }
    });
  }*/

  Widget willPopScope() {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
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
              listTitle(context, Icons.home_rounded, 'Principal', () {
                setState(() {
                  _pos = 0;
                });
              }),
              listTitle(context, Icons.search, 'Buscar peliculas', () {
                setState(() {
                  _pos = 1;
                });
              }),
              listTitle(context, Icons.person, 'Mi perfil', () {
                setState(() {
                  _pos = 2;
                });
              }),
              listTitle(context, Icons.home_rounded, 'Salir', () {
                setState(() {
                  _pos = 3;
                });
              }),
              listTitle(
                  context, Icons.announcement_outlined, 'Acerca de la app', () {
                setState(() {
                  _pos = 4;
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
      return miPerfil('pricipal');
    case 1:
      return NoRegUsScreen();
    case 2:
      return miPerfil('mi perfil');
    case 3:
      return miPerfil('salido');
    case 4:
      return miPerfil('about');
    default:
      return Container();
  }
}

Widget listTitle(context, icon, title, @required onClick) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title),
    onTap: () {
      Navigator.of(context).pop();
      onClick;
    },
  );
}

Widget listTitleAddMore(var icon, String title, @required Function onClick) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title),
    onTap: onClick,
  );
}

void onClickOne() {}
