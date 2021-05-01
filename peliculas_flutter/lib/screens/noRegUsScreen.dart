import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:peliculas_flutter/helpers/constantes.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_flutter/providers/film.dart';
import 'package:peliculas_flutter/widgets/ListPelis.dart';
import 'package:peliculas_flutter/widgets/filmDetails.dart';
import 'package:provider/provider.dart';

import 'package:peliculas_flutter/httpRequest.dart';
import 'package:peliculas_flutter/providers/lista_films.dart';
import 'package:peliculas_flutter/widgets/basedWidgets.dart';

import '../providers/lista_films.dart';

String urlDesigned = url_get_movies;
var isUser;

class NoRegUsScreen extends StatefulWidget {
  @override
  _NoRegUsScreenState createState() => _NoRegUsScreenState();
}

class _NoRegUsScreenState extends State<NoRegUsScreen> {
  var _isInit = false;

  Future<void> _getFilms(BuildContext context, {String query}) async {
    print("Refrescando películas");
    await Provider.of<ListaFilms>(
      context,
      listen: false,
    ).fetchAndSetFilms(query: query);
    print("Refrescado");
  }

  _alertDialog(Film film) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(film.title),
        content: FilmDetails(film),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("OK"),
          )
        ],
      ),
    );
  }

  Widget bodyListPelis(_context) {
    return FutureBuilder(
      future: _getFilms(_context),
      builder: (ctx, snapshot) => Column(
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: TextField(
                      onChanged: (value) {
                        //TODO: set moviesList in httpRequest: getMoviesByTitle()
                        String _key = value;
                        _getFilms(context, query: value);
                        print(_key);
                      },
                      controller: TextEditingController(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            //drawer: AppDrawer(),
            child: snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () => _getFilms(context),
                    child: Consumer<ListaFilms>(
                      child: Center(
                        child: Text('No hay películas'),
                      ),
                      builder: (ctx, films, ch) => films.list.length == 0
                          ? ch
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: films.list.length,
                              itemBuilder: (_, i) => GestureDetector(
                                onTap: () {
                                  print('movie: ${films.list[i].title}');
                                  _alertDialog(films.list[i]);
                                },
                                child: ListTile(
                                  title: Text(films.list[i].title),
                                ),
                              ),
                            ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      _isInit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    // return Consumer<ListaFilms>()
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Pelìculas'),
      ),
      body: ListaPelis(),
    );
  }
}
