import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:peliculas_flutter/constantes.dart';
import 'package:firebase_core/firebase_core.dart';

Widget basedLoginWidget(
    String title, BuildContext context, @required Function onClick) {
  String username, password;

  void onClick(context, email, password) async {
    //Firebase.initializeApp();
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      final mAuth = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (mAuth != null) {
        Navigator.pushNamed(context, mainScreenInside);
      }
    } catch (e) {
      print(e);
    }
  }

  return Material(
    child: SafeArea(
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 150, bottom: 200),
          padding: EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  decoration:
                      InputDecoration(hintText: 'Ingrese su contraseña '),
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
    ),
  );
}

Widget basedRegisterWidget(
    String title, BuildContext context, @required Function onClick) {
  String username, name, surname, email, password;

  return Material(
    child: SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 150, bottom: 200),
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Center(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Ingrese su nombre de usuario',
                ),
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
