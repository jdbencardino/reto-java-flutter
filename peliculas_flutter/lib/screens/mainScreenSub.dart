import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peliculas_flutter/httpRequest.dart';
import 'package:peliculas_flutter/screens/itemsScreen/itemsUser.dart';
import 'package:peliculas_flutter/models/subscriber.dart';
import 'package:peliculas_flutter/widgets/ListPelis.dart';
import 'noRegUsScreen.dart';
import 'package:peliculas_flutter/widgets/basedWidgets.dart';

String mainTitle = 'Lista de Pelìculas';
int _pos = 0;
Suscriber _suscriber;

class MainScreenSub extends StatefulWidget {
  @override
  _MainScreenSubState createState() => _MainScreenSubState();
}

class _MainScreenSubState extends State<MainScreenSub> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDataSubscriber(getUid()),
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.done) {
          _suscriber = snapShot.data;
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
                accountName: Text(_suscriber.username),
                accountEmail: Text(_suscriber.email),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    'U',
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
        return kSuscribersWidget(_suscriber, 'subscribers');
      case 2:
        //ver ofertas
        return Container();
      case 3:
        //cerrar sesion
        closeSesion(context);
        return Container();
    }
  }

  Widget listTitle(context, icon, title, @required onClick) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        //Navigator.of(context).pop;
        onClick(true);
      },
    );
  }
}
