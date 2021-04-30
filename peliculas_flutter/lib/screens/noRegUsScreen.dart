import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:peliculas_flutter/constantes.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_flutter/httpRequest.dart';
import 'package:peliculas_flutter/screens/mainScreen.dart';
import 'package:peliculas_flutter/baseWidgets/basedWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

String _keyWord;
List<Widget> _list = [];
BuildContext _context;
String urlDesigned = url_get_movies;
var isUser;

class NoRegUsScreen extends StatefulWidget {
  @override
  _NoRegUsScreenState createState() => _NoRegUsScreenState();
}

class _NoRegUsScreenState extends State<NoRegUsScreen> {
  @override
  Widget build(BuildContext context) {
    _context = context;
    return materialListMovies();
  }
}

Widget materialListMovies() {
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

class BodyLayout extends StatefulWidget {
  @override
  _BodyLayoutState createState() => _BodyLayoutState();
}

class _BodyLayoutState extends State<BodyLayout> {
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
              if (getUid() != null) {
                print(getUid());
                showMovieDialog(
                    getUid(), temp[i]['title'], temp[i]['id'], context);
                //  kShowMyDialogMovie(getUid(), temp[i]['title'], temp[i]['id'], _context);
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

  showMovieDialog(idUs, title, id, _MyContext) async {
    showDialog<void>(
      context: _MyContext,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                FloatingActionButton(
                  child: const Icon(Icons.play_arrow),
                  onPressed: () {
                    print('lets to see the movie! $title');
                  },
                ),
                kFlatButtonMovie(idUs, 'Views', id),
                kFlatButtonMovie(idUs, 'To see', id),
                kFlatButtonMovie(idUs, 'Favorite', id),
                kFlatButtonMovie(idUs, 'Available cinema', id)
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
