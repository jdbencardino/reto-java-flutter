import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_flutter/constantes.dart';
import 'package:http/http.dart' as http;

Widget basedLoginWidget(
    String title, BuildContext context, @required Function onClick) {
  String username, password;

  return Material(
    child: SafeArea(
      child: Center(
        child: Column(
          children: [
            Center(
              child: TextField(
                decoration: InputDecoration(hintText: 'Ingrese su email'),
                onChanged: (value) {
                  username = value;
                },
                controller: TextEditingController(),
              ),
            ),
            Center(
              child: TextField(
                decoration: InputDecoration(hintText: 'Ingrese su contraseña '),
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
                    onClick(context, username, password);
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

Widget basedRegisterWidget(
    String title, BuildContext context, @required Function onClick) {
  String username, name, surname, email, password;
  return Material(
    child: SafeArea(
      child: Center(
        child: Column(
          children: [
            Center(
              child: TextField(
                decoration:
                    InputDecoration(hintText: 'Ingrese su nombre de usuario'),
                onChanged: (value) {
                  username = value;
                },
                controller: TextEditingController(),
              ),
            ),
            Center(
              child: TextField(
                decoration:
                    InputDecoration(hintText: 'Ingrese su nombre nombre'),
                onChanged: (value) {
                  name = value;
                },
                controller: TextEditingController(),
              ),
            ),
            Center(
              child: TextField(
                decoration:
                    InputDecoration(hintText: 'Ingrese su nombre de apellido'),
                onChanged: (value) {
                  surname = value;
                },
                controller: TextEditingController(),
              ),
            ),
            Center(
              child: TextField(
                decoration:
                    InputDecoration(hintText: 'Ingrese su nombre email'),
                onChanged: (value) {
                  email = value;
                },
                controller: TextEditingController(),
              ),
            ),
            Center(
              child: TextField(
                decoration: InputDecoration(hintText: 'Ingrese su contraseña'),
                onChanged: (value) {
                  password = value;
                },
                controller: TextEditingController(),
              ),
            ),
            RaisedButton(
              child: Text('Entrar'),
              onPressed: () {
                if (username != null &&
                    name != null &&
                    surname != null &&
                    email != null &&
                    password != null) {
                  if (username.isNotEmpty &&
                      name.isNotEmpty &&
                      surname.isNotEmpty &&
                      email.isNotEmpty &&
                      password.isNotEmpty) {
                    onClick(context, username, name, surname, email, password);
                  } else {
                    print('complete todos los campos');
                  }
                } else {
                  print('complete todos los campos');
                }
              },
            ),
          ],
        ),
      ),
    ),
  );
}
