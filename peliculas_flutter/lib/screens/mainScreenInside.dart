import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peliculas_flutter/screens/itemsScreen/itemsUser.dart';
import 'noRegUsScreen.dart';
import 'package:peliculas_flutter/itemsScreen/user.dart';
import 'package:peliculas_flutter/constantes.dart';
import 'package:peliculas_flutter/baseWidgets/basedWidgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'noRegUsScreen.dart';

class _MainScreenInsideState {
  BuildContext _context;
  int _pos = 0;
  String title = 'Principal';

  @override
  Widget build(BuildContext context) {
    _context = context;
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
          title: Text(title),
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
              //TODO: agregar los widgets necesarios en la barra lateral
              listTitle(_context, Icons.home_rounded, 'Principal', () {
                title = 'Principal';
                _pos = 0;
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
    default:
      return Container();
  }
}

Future<Suscriber> getCompleteUser(uid) async {}
