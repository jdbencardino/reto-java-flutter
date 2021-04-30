import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import '../../httpRequest.dart';
import './suscriber.dart';
import '../../widgets/basedWidgets.dart';

Suscriber suscriber;

void getAccessLevel() {
  FirebaseAuth mAuth = FirebaseAuth.instance;
  mAuth.currentUser.getIdTokenResult(false).then((value) {});
}

Future<void> userType() async {
  //getAccessLevel();
  FirebaseAuth mAuth = await FirebaseAuth.instance;
  if (mAuth != null) {
    String uid = mAuth.currentUser.uid.toString();
    String url = 'http://localhost:8080/subscribers/search/findByUid?uid=$uid';
    String token = await mAuth.currentUser.getIdToken();
    Uri link = Uri.parse(url);
    var respuesta = await http.get(
      link,
      headers: {'Authorization': 'Bearer ${token}'},
    );

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

    suscriber = await Suscriber(
      id,
      username,
      uid,
      name,
      surname,
      email,
      points,
    );
  } else {
    print('halo');
  }
}

class MiPerfil extends StatefulWidget {
  @override
  _MiPerfilState createState() => _MiPerfilState();
}

class _MiPerfilState extends State<MiPerfil> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          return Container();
        }
        if (projectSnap.connectionState == ConnectionState.done) {
          print(projectSnap.connectionState);
          return Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                kTextDataUser(
                    suscriber.id, 'Username', suscriber.username, 'username',
                    (value) {
                  if (value != null) {
                    if (value.toString().length != 0) {
                      httpUpdate(suscriber.id, 'username', value);
                      setState(() {
                        suscriber.username = value;
                        print(value.toString());
                      });
                    }
                  }
                }),
                kTextDataUser(suscriber.id, "Nombre", suscriber.name, 'name',
                    (value) {
                  if (value != null) {
                    if (value.toString().length != 0) {
                      httpUpdate(suscriber.id, 'name', value);
                      setState(() {
                        suscriber.name = value;
                        print(value.toString());
                      });
                    }
                  }
                }),
                kTextDataUser(
                    suscriber.id, "Apellido", suscriber.surname, 'surname',
                    (value) {
                  if (value != null) {
                    if (value.toString().length != 0) {
                      httpUpdate(suscriber.id, 'surname', value);
                      setState(() {
                        suscriber.surname = value;
                        print(value.toString());
                      });
                    }
                  }
                }),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Email : ${suscriber.email}',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Puntos : ${suscriber.points}',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                      child: Text('BORRAR CUENTA'),
                      onPressed: () async {
                        deleteAccount(getUid(), context);
                      }),
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      },
      future: userType(),
    );
  }
}
