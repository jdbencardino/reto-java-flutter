import 'package:flutter/material.dart';

class Film with ChangeNotifier {
  Film({
    this.title = "",
  });

  String title;
}
