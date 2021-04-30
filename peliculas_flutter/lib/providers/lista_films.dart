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

  Future<void> fetchAndSetFilms() async {
    final url = Uri.parse('${ApiHelper.url_get_movies}');
    print(url);
    // TODO add Authentication header to this

    try {
      final response = await http.get(url);
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

      _list = filmList;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
