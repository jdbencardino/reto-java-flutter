import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:peliculas_flutter/httpRequest.dart';
import 'package:peliculas_flutter/models/admin.dart';
import 'package:peliculas_flutter/models/cine.dart';
import 'package:peliculas_flutter/widgets/ListPelis.dart';
import 'package:peliculas_flutter/widgets/kCinemaWidget.dart';

class MainScreenCine extends StatefulWidget {
  @override
  _MainScreenCineState createState() => _MainScreenCineState();
}

class _MainScreenCineState extends State<MainScreenCine> {
  String mainTitle = 'Cinema Panel';
  int _pos = 0;
  Cine _cine;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDataCinema(getUid()),
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.done) {
          _cine = snapShot.data;
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
          backgroundColor: Colors.yellow,
          title: Text(mainTitle),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.yellow,
                ),
                accountName: Text(_cine.username),
                accountEmail: Text(_cine.email),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    'C',
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
        // body: Container(),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        // ),
        floatingActionButton: _pos == 0
            ? FloatingActionButton(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.add),
                onPressed: () {
                  print("Agregar película");
                },
              )
            : null,
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
        return kCinemaWidget(_cine, 'cinemas');
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
        Navigator.of(context).pop;
        onClick(true);
      },
    );
  }
}
