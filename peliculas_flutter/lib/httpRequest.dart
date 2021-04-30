import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_flutter/helpers/api_helper.dart';
import 'package:peliculas_flutter/providers/film.dart';
import 'package:peliculas_flutter/screens/itemsScreen/suscriber.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'helpers/constantes.dart';

void httpSetFilm(idUser, idFilm, type) async {
  try {
    Uri link = Uri.parse('localhost:8080/film-lists');
    var respuesta = await http.post(
      link,
      headers: {'content-Type': 'application/json'},
      body: jsonEncode({
        "listType": "$type",
        "user": "http://localhost:8080/users/$idUser",
        "film": "http://localhost:8080/films/$idFilm"
      }),
    );
  } catch (e) {
    print(e);
  }
}

void httpUpdate(id, key, data) async {
  Uri url = Uri.parse('http://localhost:8080/users/$id');
  var response = await http.patch(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(
      <Object, Object>{
        key: data,
      },
    ),
  );
  print(response.statusCode);
}

String getUid() {
  Firebase.initializeApp();
  FirebaseAuth mAuth = FirebaseAuth.instance;
  if (mAuth != null) {
    return mAuth.currentUser.uid;
  } else {
    return null;
  }
}

Future<Object> getMoviesByTitle(title) async {
  try {
    Uri uri = Uri.parse('${ApiHelper.url_get_movie_from_title}$title');
    final response = await http.get(uri);
    final responseData = json.decode(response.body) as Map<String, dynamic>;

    final resList = responseData['_embedded']['films'] as List<dynamic>;

    final List<Film> filmList = resList
        .map((data) {
          final film = Film(title: data['title']);
          return film;
        })
        .toList()
        .reversed
        .toList();

    return filmList;
  } catch (e) {}
}

Future<Suscriber> getDataSubscriber() async {
  try {
    Uri uri = Uri.parse('${ApiHelper.url_get_users}$title');
    final response = await http.get(uri);
    final responseData = json.decode(response.body) as Map<String, dynamic>;

    final resList = responseData['_embedded']['films'] as List<dynamic>;

    final List<Film> filmList = resList
        .map((data) {
          final film = Film(title: data['title']);
          return film;
        })
        .toList()
        .reversed
        .toList();

    return filmList;
  } catch (e) {}
}
