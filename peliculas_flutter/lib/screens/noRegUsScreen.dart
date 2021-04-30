import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:peliculas_flutter/constantes.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_flutter/screens/mainScreen.dart';
import 'package:peliculas_flutter/baseWidgets/basedWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:peliculas_flutter/brain.dart';

String _keyWord;
List<Widget> _list = [];
BuildContext _context;
String urlDesigned = url_get_movies;
var isUser;

ListTile listTile(String value) {
  return ListTile(
    title: Text(value),
  );
}

class NoRegUsScreen extends StatefulWidget {
  @override
  _NoRegUsScreenState createState() => _NoRegUsScreenState();
}

class _NoRegUsScreenState extends State<NoRegUsScreen> {
  @override
  Widget build(BuildContext context) {
    _context = context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de peliculas',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
          appBar: AppBar(title: Text('Peliculas disponibles')),
          body: BodyLayout()),
    );
  }
}

class BodyLayout extends StatefulWidget {
  @override
  _BodyLayoutState createState() => _BodyLayoutState();
}

class _BodyLayoutState extends State<BodyLayout> {
  @override
  void initState() {
    super.initState();
  }

  Future _myList(url) async {
    _list.clear();
    try {
      Uri link = Uri.parse(url);
      print(url);
      var respuesta = await http.get(link);
      var temp =
          jsonDecode(respuesta.body)['_embedded']['films'] as List<dynamic>;
      for (int i = 0; i < temp.length; i++) {
        _list.add(
          kWidget(
            temp[i]['title'],
            temp[i]['description'],
            temp[i]['date'],
            () {
              String val;

              if (isUser != null) {
                kShowMyDialogMovie(
                    temp[i]['title'], temp[i]['id'].toString(), _context);
              }
            },
          ),
        );
      }
      return _list;
    } catch (e) {
      print(e);
      return _list;
    }
  }

  Future<void> callDialog(key) async {
    await getIdFromShared(key).then((value) {
      isUser = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          return Container();
        }
        return kMyListView(() {
          setState(() {
            urlDesigned = '$url_get_movie_from_title$_keyWord';
          });
        });
      },
      future: _myList(urlDesigned),
    );
  }
}

Widget kMyListView(@required onClick) {
  return Column(
    children: <Widget>[
      Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15),
                child: TextField(
                  onChanged: (value) {
                    _keyWord = value;
                    //print(_keyWord);
                  },
                ),
              ),
              FloatingActionButton(
                child: Icon(Icons.search),
                onPressed: onClick,
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[..._list],
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}
