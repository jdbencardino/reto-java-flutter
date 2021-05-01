import 'package:flutter/material.dart';

class Film with ChangeNotifier {
  Film({
    this.title = "",
    this.description = "",
    this.categoria,
    this.director,
    this.actores,
  });

  String title;
  String description;
  List<String> director = [];
  List<String> categoria = [];
  List<String> actores = [];
}
