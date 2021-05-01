import 'package:flutter/material.dart';
import 'package:peliculas_flutter/providers/film.dart';
import 'package:peliculas_flutter/providers/lista_films.dart';
import 'package:peliculas_flutter/widgets/filmDetails.dart';
import 'package:provider/provider.dart';

class ListaPelis extends StatefulWidget {
  @override
  _ListaPelisState createState() => _ListaPelisState();
}

class _ListaPelisState extends State<ListaPelis> {
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getFilms(context),
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
}
