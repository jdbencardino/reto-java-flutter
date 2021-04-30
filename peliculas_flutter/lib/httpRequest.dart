import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_flutter/screens/itemsScreen/suscriber.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
