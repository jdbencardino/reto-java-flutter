import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BodyLayout extends StatefulWidget {
  @override
  _BodyLayoutState createState() => _BodyLayoutState();
}

class _BodyLayoutState extends State<BodyLayout> {
  List _list = [];

  Future _myList(url) async {
    _list.clear();
    try {
      Uri link = Uri.parse(url);
      print(url);
      var respuesta = await http.get(link);
      var temp =
          jsonDecode(respuesta.body)['_embedded']['films'] as List<dynamic>;
      for (int i = 0; i < temp.length; i++) {
        print(i);
      }
      return _list;
    } catch (e) {
      print(e);
      return _list;
    }
  }

  Future _showMyDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (_) => _buildAlertDialog(),
    );
  }

  Widget _buildAlertDialog() {
    return AlertDialog(
      title: Text('Notificaciones'),
      content:
          Text("¿Desea recibir notificaciones? Serán muy pocas de verdad :)"),
      actions: [
        FlatButton(
            child: Text("Aceptar"),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.of(context).pop();
            }),
        FlatButton(
            child: Text("Cancelar"),
            textColor: Colors.red,
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}
