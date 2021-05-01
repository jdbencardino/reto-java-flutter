import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:peliculas_flutter/helpers/api_helper.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import './film.dart';

class ListaFilms with ChangeNotifier {
  List<Film> _list = [];

  List<Film> get list {
    return [..._list];
  }

  String extractUrl(dynamic data, String type) {
    return data['_links'][type]['href'];
  }

  Future<List<String>> getResponseData(String href) async {
    final url = Uri.parse(href);

    try {
      final response = await http.get(url);
      final responseData = json.decode(response.body) as Map<String, dynamic>;

      if (responseData.containsKey('_embedded')) {
        final resList = responseData['_embedded']['actors'] as List<dynamic>;

        final List<String> actors =
            resList.map((data) => data['actor_name'] as String).toList();
        return actors;
      }

      return [responseData['category_name'] ?? responseData['director_name']];
    } catch (e) {
      print(e);
    }
  }

  Future<Film> getFilmFromData(data) async {
    final actorurl = extractUrl(data, 'actorSet');
    final actorList = await getResponseData(actorurl);
    final categoryurl = extractUrl(data, 'category');
    final categoryList = await getResponseData(categoryurl);
    final directorurl = extractUrl(data, 'director');
    final direcorList = await getResponseData(directorurl);

    return Film(
      title: data['title'] ?? "not found",
      description: data['description'] ?? "not found",
      director: direcorList ?? [],
      categoria: categoryList ?? [],
      actores: actorList ?? [],
    );
  }

  Future<void> fetchAndSetFilms() async {
    final url = Uri.parse('${ApiHelper.url_get_movies}');
    print(url);
    // TODO add Authentication header to this

    try {
      final response = await http.get(url);
      final responseData = json.decode(response.body) as Map<String, dynamic>;

      final resList = responseData['_embedded']['films'] as List<dynamic>;

      final List<Film> filmList = await Future.wait(
        resList
            .map(
              (data) async => await getFilmFromData(data),
            )
            .toList(),
      );

      _list = filmList;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
