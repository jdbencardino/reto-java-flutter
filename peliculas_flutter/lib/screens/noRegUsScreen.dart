import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:peliculas_flutter/constantes.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_flutter/offDatabase.dart';

class NoRegUsScreen extends StatefulWidget {
  @override
  _NoRegUsScreenState createState() => _NoRegUsScreenState();
}

class _NoRegUsScreenState extends State<NoRegUsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de peliculas',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Peliculas disponibles')),
        body: BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          return Container();
        }
        return _myListView();
      },
      future: _myList(),
    );
  }
}

ListTile listTile(String value) {
  return ListTile(
    title: Text(value),
  );
}

List<ListTile> _list = [];

Future _myList() async {
  _list.clear();
  try {
    Uri link = Uri.parse(url_get_movies);
    //List<String> _peliculas =  await ;
    var respuesta = await http.get(link);
    int i = 0;
    while (
        jsonDecode(respuesta.body)['_embedded']['films'][i]['title'] != null) {
      _list.add(
        listTile(
          jsonDecode(respuesta.body)['_embedded']['films'][i]['title'],
        ),
      );
    }
    // for (int i = 0; i < 5; i++) {
    //   _list.add(
    //     listTile(
    //       jsonDecode(respuesta.body)['_embedded']['films'][i]['title'],
    //     ),
    //   );
    // }
    return _list;
  } catch (e) {
    print(e);
    return null;
  }
}

Widget _myListView() {
  return ListView(
    children: <Widget>[
      ..._list,
    ],
  );
}
