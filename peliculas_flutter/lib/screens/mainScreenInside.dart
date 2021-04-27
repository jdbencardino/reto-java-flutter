import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_flutter/constantes.dart';
import 'package:peliculas_flutter/baseWidgets/baseLoginWidget.dart';
import 'package:http/http.dart' as http;

String username, email, password;

class MainScreenInside extends StatefulWidget {
  @override
  _MainScreenInsideState createState() => _MainScreenInsideState();
}

class _MainScreenInsideState extends State<MainScreenInside> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  controller: _controller,
                ),
              ),
              Center(
                child: TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  controller: _controller,
                ),
              ),
              Center(
                child: TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  controller: _controller,
                ),
              ),
              RaisedButton(
                onPressed: () {
                  presiono();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void presiono() async {
  if (username.isEmpty && email.isEmpty) {
    print('Set a username or email ');
  } else {
    if (password.isEmpty) {
      print('set a password');
    } else {
      String data = username.isEmpty ? email : username;
      try {
        String url = 'http://localhost/logUser$data#$password';
        Uri link = Uri.parse(url_get_movies);
        //List<String> _peliculas =  await ;
        var respuesta = await http.get(link);
        print(respuesta.statusCode);
      } catch (e) {
        print(e);
      }
    }
  }
}
