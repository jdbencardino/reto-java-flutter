import 'dart:convert';
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
  FirebaseAuth mAuth = FirebaseAuth.instance;
  if (mAuth != null) {
    return mAuth.currentUser.uid;
  } else {
    return null;
  }
}

Future<void> userType() async {
  FirebaseAuth mAuth = FirebaseAuth.instance;
  if (mAuth != null) {
    String uid = mAuth.currentUser.uid.toString();
    String url = 'http://localhost:8080/users/search/findByUid?uid=$uid';
    Uri link = Uri.parse(url);
    var respuesta = await http.get(link);

    var id = jsonDecode(respuesta.body)['_embedded']['subscribers'][0]['id']
        .toString();
    var username =
        jsonDecode(respuesta.body)['_embedded']['subscribers'][0]['username'];
    var name =
        jsonDecode(respuesta.body)['_embedded']['subscribers'][0]['name'];
    var surname =
        jsonDecode(respuesta.body)['_embedded']['subscribers'][0]['surname'];
    var email =
        jsonDecode(respuesta.body)['_embedded']['subscribers'][0]['email'];
    var points =
        jsonDecode(respuesta.body)['_embedded']['subscribers'][0]['points'];

    //print('$id');

    user_suscriber = await Suscriber(
        id, username, uid, name, surname, email, points, 'Usuario', 'NA', 'NA');
  }
}

void deleteAccount(uid, _context) async {
  uid = 'Ctk567bPoOd1QohSz2VcpuuPUvT2';
  try {
    FirebaseAuth _mAuth = FirebaseAuth.instance;
    String token = await _mAuth.currentUser.getIdToken();
    Uri link = Uri.parse('$delete_user_by_uid$uid');
    if (uid != getUid()) {
      //delete user in database
      var respuesta = await http.get(
        link,
        headers: {'Authorization': 'Bearer ${token}'},
      );

      if (respuesta.statusCode < 400) {
        // delete user in firebase
        FirebaseAuth mAuth = FirebaseAuth.instance;
        await mAuth.currentUser.delete();
        print('User deleted');
        Navigator.pushNamed(_context, mainScreenId);
      } else {
        print(respuesta.statusCode);
      }
      // borrar en base de datos y en firebase y eliminar instancia local (logout)
    } else {
      // borrar en base de datos, firebase
    }
  } catch (e) {
    print(e);
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
