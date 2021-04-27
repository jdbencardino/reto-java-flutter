import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_flutter/constantes.dart';
import 'package:http/http.dart' as http;

String username, password;

Widget basedLoginWidget(
    String title, BuildContext context, @required Function onClick) {
  return Material(
    child: SafeArea(
      child: Center(
        child: Column(
          children: [
            Center(
              child: TextField(
                onChanged: (value) {
                  username = value;
                },
                controller: TextEditingController(),
              ),
            ),
            Center(
              child: TextField(
                onChanged: (value) {
                  password = value;
                },
                controller: TextEditingController(),
              ),
            ),
            RaisedButton(
              child: Text('Entrar'),
              onPressed: () async {
                if (username != null && password != null) {
                  if (username.isNotEmpty && password.isNotEmpty) {
                    onClick();
                  } else {
                    print('ingrese algun usuario y contraseña');
                  }
                } else {
                  print('ingrese algun usuario y contraseña');
                }
              },
            ),
          ],
        ),
      ),
    ),
  );
}

Widget basedRegisterWidget() {
  return Material(
    child: SafeArea(
      child: Center(
        child: Column(
          children: [
            Center(
              child: TextField(
                onChanged: (value) {
                  username = value;
                },
                controller: TextEditingController(),
              ),
            ),
            Center(
              child: TextField(
                onChanged: (value) {
                  password = value;
                },
                controller: TextEditingController(),
              ),
            ),
            RaisedButton(
              child: Text('Entrar'),
              onPressed: () async {
                if (username != null && password != null) {
                  if (username.isNotEmpty && password.isNotEmpty) {
                    try {
                      String url =
                          'http://localhost/logUser$username#$password';
                      Uri link = Uri.parse(url_get_movies);
                      var respuesta = await http.get(link);
                      print(respuesta.statusCode);
                    } catch (e) {
                      print(e);
                    }
                  } else {
                    print('ingrese algun usuario y contraseña');
                  }
                } else {
                  print('ingrese algun usuario y contraseña');
                }
              },
            ),
          ],
        ),
      ),
    ),
  );
}
