import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peliculas_flutter/screens/itemsScreen/itemsUser.dart';

String mainTitle = 'Principal';

class MainScreenSub extends StatefulWidget {
  @override
  _MainScreenSubState createState() => _MainScreenSubState();
}

class _MainScreenSubState extends State<MainScreenSub> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

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
              //TODO: agregar los widgets necesarios en la barra lateral
              listTitle(context, Icons.home_rounded, 'Principal', () {
                setState(() {
                  mainTitle = 'Principal';
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
}

Widget _getWidgetItemSelected(int pos) {
  switch (pos) {
    case 0:
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
