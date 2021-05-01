import 'package:peliculas_flutter/models/admin.dart';
import 'package:peliculas_flutter/widgets/basedWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:peliculas_flutter/helpers/constantes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:peliculas_flutter/models/admin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:peliculas_flutter/httpRequest.dart';

Widget kAdminWidget(Admin admin, String access_level) {
  return Container(
    child: Column(
      children: [
        kTextUserPlantilla(
            admin.username, 'digite su nuevo nombre de user', Icon(Icons.edit),
            (value) {
          if (value != null) {
            if (value.toString().isNotEmpty) {
              httpUpdateSubs(admin.id, 'username', value, access_level);
            }
          }
        }),
        kTextUserPlantilla(
            admin.name, 'digite su nuevo nombre', Icon(Icons.edit), (value) {
          if (value != null) {
            if (value.toString().isNotEmpty) {
              httpUpdateSubs(admin.id, 'name', value, access_level);
            }
          }
        }),
        kTextUserPlantilla(
            admin.surname, 'digite su nuevo apellido', Icon(Icons.edit),
            (value) {
          if (value != null) {
            if (value.toString().isNotEmpty) {
              httpUpdateSubs(admin.id, 'surname', value, access_level);
            }
          }
        }),
        Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text('Email: ${admin.email}'),
          ),
        ),
      ],
    ),
  );
}
