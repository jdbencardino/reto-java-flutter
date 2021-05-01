import 'package:peliculas_flutter/models/cine.dart';
import 'package:peliculas_flutter/widgets/basedWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_flutter/httpRequest.dart';

Widget kCinemaWidget(Cine cine, String access_level) {
  return Container(
    child: Column(
      children: [
        kTextUserPlantilla(
            cine.username, 'digite su nuevo nombre de user', Icon(Icons.edit),
            (value) {
          if (value != null) {
            if (value.toString().isNotEmpty) {
              httpUpdateSubs(cine.id, 'username', value, access_level);
            }
          }
        }),
        kTextUserPlantilla(
            cine.name, 'digite su nuevo nombre', Icon(Icons.edit), (value) {
          if (value != null) {
            if (value.toString().isNotEmpty) {
              httpUpdateSubs(cine.id, 'name', value, access_level);
            }
          }
        }),
        kTextUserPlantilla(
            cine.surname, 'digite su nuevo apellido', Icon(Icons.edit),
            (value) {
          if (value != null) {
            if (value.toString().isNotEmpty) {
              httpUpdateSubs(cine.id, 'surname', value, access_level);
            }
          }
        }),
        kTextUserPlantilla(
            cine.surname, 'digite su nueva web', Icon(Icons.edit), (value) {
          if (value != null) {
            if (value.toString().isNotEmpty) {
              httpUpdateSubs(cine.id, 'web', value, access_level);
            }
          }
        }),
        kTextUserPlantilla(
            cine.surname, 'digite su nueva dirección', Icon(Icons.edit),
            (value) {
          if (value != null) {
            if (value.toString().isNotEmpty) {
              httpUpdateSubs(cine.id, 'address', value, access_level);
            }
          }
        }),
        Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text('Email: ${cine.email}'),
          ),
        ),
      ],
    ),
  );
}
