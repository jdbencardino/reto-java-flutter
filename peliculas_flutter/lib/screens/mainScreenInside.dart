import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peliculas_flutter/baseWidgets/basedWidgets.dart';
import 'package:peliculas_flutter/constantes.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_flutter/itemsScreen/itemsUser.dart';

class MainScreenInside extends StatefulWidget {
  @override
  _MainScreenInsideState createState() => _MainScreenInsideState();
}

String username = 'Cristian';
String accessLevel = 'Usuario';

int pos = 0;

class _MainScreenInsideState extends State<MainScreenInside> {
  @override
  Widget build(BuildContext context) {
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
                accountName: Text(username),
                accountEmail: Text(accessLevel),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    'U',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home_rounded),
                title: Text('Principal'),
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    pos = 0;
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.search),
                title: Text('Buscar peliculas'),
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    pos = 1;
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Mi perfil'),
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    pos = 2;
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.close),
                title: Text('Salir'),
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    pos = 3;
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.announcement_outlined),
                title: Text('Acerca de la app'),
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    print('si pasa');
                    pos = 4;
                  });
                },
              ),
            ],
          ),
        ),
        body: _getWidgetItemSelected(pos),
      ),
    );
  }
}

Widget _getWidgetItemSelected(int pos) {
  switch (pos) {
    case 0:
      return miPerfil('pricipal');
    case 1:
      return miPerfil('buscar movie');
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

Widget listTitleAddMore(var icon, String title, @required Function onClick) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title),
    onTap: onClick,
  );
}

void onClickOne() {}
