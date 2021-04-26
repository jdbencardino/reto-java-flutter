import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:peliculas_flutter/constantes.dart';
import 'package:http/http.dart' as http;

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
        appBar: AppBar(title: Text('ListViews')),
        body: BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

List<ListTile> _list = [];

ListTile listTile(String value) {
  return ListTile(
    title: Text(value),
  );
}

void blankList() {
  _list.clear();
}

void getList() {
  _list.add(listTile('El conde de montecristo'));
  _list.add(listTile('Votos de amor'));
  _list.add(listTile('Jason Bourne'));
  _list.add(listTile('FMI 4 - protocolo fantasma'));
  _list.add(listTile('FMI 6 - repercusion'));
}

// replace this function with the code in the examples
Widget _myListView(BuildContext context) {
  blankList();
  getList();
  getMovies();
  return ListView(
    children: <Widget>[
      ..._list,
    ],
  );
}

void getMovies() async {
  try {
    Uri link = Uri.parse(url_get_movies);
    //List<String> _peliculas =  await ;
    var respuesta = await http.get(link);
    var title=jsonDecode(respuesta.body)['_embedded']['films'][3]['title'];
    print(title);
  } catch (e) {
    print(e);
  }
}