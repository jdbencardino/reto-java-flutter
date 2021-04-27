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
        appBar: AppBar(title: Text('Peliculas!')),
        body: BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getMovies();
    return _myListView(context);
  }
}

List<ListTile> _list = [];

ListTile listTile(String value) {
  return ListTile(
    title: Text(value),
  );
}

// replace this function with the code in the examples
Widget _myListView(BuildContext context) {
  _list.clear();
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
    for (int i = 0; i < 5; i++) {
      _list.add(
        listTile(
          jsonDecode(respuesta.body)['_embedded']['films'][i]['title'],
        ),
      );
      print(jsonDecode(respuesta.body)['_embedded']['films'][i]['title']);
    }
  } catch (e) {
    print(e);
  }
}
