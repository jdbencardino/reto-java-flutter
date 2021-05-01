import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:peliculas_flutter/httpRequest.dart';
import 'package:peliculas_flutter/models/admin.dart';
import 'package:peliculas_flutter/screens/itemsScreen/itemsUser.dart';
import 'package:peliculas_flutter/models/subscriber.dart';
import 'package:peliculas_flutter/widgets/ListPelis.dart';
import 'package:peliculas_flutter/widgets/basedWidgets.dart';
import 'package:peliculas_flutter/widgets/kAdminWidget.dart';
import 'noRegUsScreen.dart';

class MainScreenAdmin extends StatefulWidget {
  @override
  _MainScreenAdminState createState() => _MainScreenAdminState();
}

class _MainScreenAdminState extends State<MainScreenAdmin> {
  String mainTitle = 'Admin Panel';
  int _pos = 0;
  Admin _admin;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDataAdmin(getUid()),
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.done) {
          _admin = snapShot.data;
          return willPopScope();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget willPopScope() {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        SystemNavigator.pop();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(mainTitle),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                accountName: Text(_admin.username),
                accountEmail: Text(_admin.email),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    'A',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              listTitle(context, Icons.search, 'Buscar pelìcula', (value) {
                _pos = 0;
                setState(() {
                  mainTitle = 'Buscar pelìcula';
                });
              }),
              listTitle(context, Icons.person, 'Mi perfìl', (value) {
                _pos = 1;
                setState(() {
                  mainTitle = 'Mi perfìl';
                });
              }),
              listTitle(context, Icons.person_add, 'Mi perfìl', (value) {
                _pos = 4;
                setState(() {
                  mainTitle = 'User Profile';
                });
              }),
              listTitle(context, Icons.local_offer, 'Ofertas', (value) {
                _pos = 2;
                setState(() {
                  mainTitle = 'Ofertas';
                });
              }),
              listTitle(context, Icons.close, 'Cerrar sesiòn', (value) {
                // ignore: unnecessary_statements
                _pos = 3;
                setState(() {});
              }),
            ],
          ),
        ),
        body: _getWidgetItemSelected(_pos),
      ),
    );
  }

  Widget _getWidgetItemSelected(int pos) {
    switch (pos) {
      case 0:
        //listar peliculas
        return ListaPelis();
      case 1:
        //mi perfil
        return kAdminWidget(_admin, 'subscribers');
      case 2:
        //ver ofertas
        return Container();
      case 3:
        //cerrar sesion
        closeSesion(context);
        return Container();
      case 4:
        //cerrar sesion
        return Container();
    }
  }

  Widget listTitle(context, icon, title, @required onClick) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.of(context).pop;
        onClick(true);
      },
    );
  }
}
