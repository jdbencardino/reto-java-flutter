import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peliculas_flutter/screens/itemsScreen/itemsUser.dart';
import 'package:peliculas_flutter/models/suscriber.dart';

String mainTitle = 'Principal';
int _pos = 0;
Suscriber suscriber;

class MainScreenSub extends StatefulWidget {
  @override
  _MainScreenSubState createState() => _MainScreenSubState();
}

class _MainScreenSubState extends State<MainScreenSub> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSubsData(),
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.done) {
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
              listTitle(context, Icons.search, 'Buscar pelìcula', () {
                setState(() {
                  mainTitle = 'Principal';
                  _pos = 0;
                });
              }),
              listTitle(context, Icons.person, 'Mi perfìl', () {
                setState(() {
                  mainTitle = 'Mi perfìl';
                  _pos = 0;
                });
              }),
              listTitle(context, Icons.local_offer, 'Ofertas', () {
                setState(() {
                  mainTitle = 'Ofertas';
                  _pos = 0;
                });
              }),
              listTitle(context, Icons.close, 'Cerrar sesiòn', () {
                setState(() {
                  _pos = 0;
                });
              }),
            ],
          ),
        ),
        body: _getWidgetItemSelected(_pos),
      ),
    );
  }

  Future<void> getSubsData() {
    return null;
  }

  Widget _getWidgetItemSelected(int pos) {
    switch (pos) {
      case 0:
        //listar peliculas
        return Container();
      case 0:
        //mi perfil
        return Container();
      case 0:
        //ver ofertas
        return Container();
      case 0:
        //cerrar sesion
        return Container();
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
        onClick();
      },
    );
  }
}
