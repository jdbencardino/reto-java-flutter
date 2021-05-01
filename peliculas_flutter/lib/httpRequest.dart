import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_flutter/helpers/api_helper.dart';
import 'package:peliculas_flutter/models/admin.dart';
import 'package:peliculas_flutter/models/cine.dart';
import 'package:peliculas_flutter/providers/film.dart';
import 'helpers/constantes.dart';
import './helpers/constantes.dart';
import 'models/subscriber.dart';

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

void httpUpdateSubs(id, key, data, access_level) async {
  Uri url = Uri.parse('http://localhost:8080/$access_level/$id');
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

void deleteAccount(uid, _context) async {
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

Future<Suscriber> getDataSubscriber(uid) async {
  try {
    Uri uri = Uri.parse('${ApiHelper.url_get_subscriber_by_id}$uid');
    final response = await http.get(uri);
    final responseData = json.decode(response.body) as Map<dynamic, dynamic>;

    final resList = responseData['_embedded']['subscribers'] as List<dynamic>;

    Suscriber suscriber;
    resList
        .map((data) {
          suscriber = Suscriber(
            data['id'].toString(),
            data['username'],
            uid,
            data['name'],
            data['surname'],
            data['email'],
            data['points'],
          );
          print("Los datos fueron guardados con Exito");
        })
        .toList()
        .reversed
        .toList();
    return suscriber;
  } catch (e) {
    print(e);
  }
}

Future<Admin> getDataAdmin(uid) async {
  try {
    Uri uri = Uri.parse('${ApiHelper.url_get_admin_by_id}$uid');
    final response = await http.get(uri);
    final responseData = json.decode(response.body) as Map<dynamic, dynamic>;

    final resList = responseData['_embedded']['admins'] as List<dynamic>;

    Admin admin;
    resList.forEach((data) {
      admin = Admin(
        data['id'].toString(),
        data['username'],
        uid,
        data['name'],
        data['surname'],
        data['email'],
      );
      print("Los datos fueron guardados con Exito");
    });
    return admin;
  } catch (e) {
    print(e);
  }
}

Future<Cine> getDataCinema(uid) async {
  try {
    Uri uri = Uri.parse('${ApiHelper.url_get_cinema_by_id}$uid');
    final response = await http.get(uri);
    final responseData = json.decode(response.body) as Map<dynamic, dynamic>;

    final resList = responseData['_embedded']['cinemas'] as List<dynamic>;

    Cine cine;
    resList.forEach((data) {
      cine = Cine(
        data['id'].toString(),
        data['username'],
        uid,
        data['name'],
        data['surname'],
        data['email'],
        data['web'],
        data['address'],
      );
      print("Los datos fueron guardados con Exito");
    });
    return cine;
  } catch (e) {
    print(e);
  }
}

void closeSesion(context) async {
  FirebaseAuth mAuth = FirebaseAuth.instance;
  if (mAuth != null) {
    if (mAuth.currentUser.uid.isNotEmpty) {
      print('User is signed in!');
      await FirebaseAuth.instance.signOut();
      Navigator.pushNamed(context, mainScreenId);
    }
  }
}
