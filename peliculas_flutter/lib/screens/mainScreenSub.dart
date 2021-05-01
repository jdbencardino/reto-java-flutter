import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peliculas_flutter/httpRequest.dart';
import 'package:peliculas_flutter/screens/itemsScreen/itemsUser.dart';
import 'package:peliculas_flutter/screens/itemsScreen/suscriber.dart';
import 'package:peliculas_flutter/widgets/basedWidgets.dart';

String mainTitle = 'Principal';
int _pos = 0;
Suscriber _suscriber;

class MainScreenSub extends StatefulWidget {
  @override
  _MainScreenSubState createState() => _MainScreenSubState();
}

class _MainScreenSubState extends State<MainScreenSub> {
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
                accountName: Text('name'),
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
                  _pos = 1;
                });
              }),
              listTitle(context, Icons.local_offer, 'Ofertas', () {
                setState(() {
                  mainTitle = 'Ofertas';
                  _pos = 2;
                });
              }),
              listTitle(context, Icons.close, 'Cerrar sesiòn', () {
                setState(() {
                  _pos = 3;
                });
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
        return Container();
      case 1:
        //mi perfil
        print('holita');
        return FutureBuilder(
          // ignore: missing_return
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.done) {
              _suscriber = snapShot.data;
              return kSuscribersWidget(snapShot.data, 'subscribers');
            }
            return Container();
          },
          future: getDataSubscriber(getUid()),
        );
      case 2:
        //ver ofertas
        return Container();
      case 3:
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
