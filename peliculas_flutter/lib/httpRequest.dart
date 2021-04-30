import 'dart:convert';
import 'package:http/http.dart' as http;

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

void httpUpdate() async {
  String id = '1';
  Uri url = Uri.parse('http://localhost:8080/users/$id');
  var response = await http.patch(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(
      <Object, Object>{
        "username": "juan2",
      },
    ),
  );
  print(response.body);
}
