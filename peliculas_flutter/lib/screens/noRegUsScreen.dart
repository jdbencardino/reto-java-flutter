import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:peliculas_flutter/helpers/constantes.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:peliculas_flutter/httpRequest.dart';
import 'package:peliculas_flutter/providers/lista_films.dart';
import 'package:peliculas_flutter/widgets/basedWidgets.dart';

import '../providers/lista_films.dart';

String urlDesigned = url_get_movies;
var isUser;

class NoRegUsScreen extends StatefulWidget {
  @override
  _NoRegUsScreenState createState() => _NoRegUsScreenState();
}

class _NoRegUsScreenState extends State<NoRegUsScreen> {
  var _isInit = false;

  Future<void> _getFilms(BuildContext context) async {
    print("Refrescando películas");
    await Provider.of<ListaFilms>(
      context,
      listen: false,
    ).fetchAndSetFilms();
    print("Refrescado");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      _isInit = true;
    }
  }

  Widget bodyListPelis(_context) {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    onChanged: (value) {
                      //TODO: set moviesList in httpRequest: getMoviesByTitle()
                      String _key = value;
                      print(_key);
                    },
                    controller: TextEditingController(),
                  ),
                ),
              ),
            ],
          ),
        ),
        FutureBuilder(
          future: _getFilms(_context),
          builder: (ctx, snapshot) => Container(
            //drawer: AppDrawer(),
            child: snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () => _getFilms(context),
                    child: Consumer<ListaFilms>(
                      child: Center(
                        child: Text('No hay películas'),
                      ),
                      builder: (ctx, films, ch) => films.list.length == 0
                          ? ch
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: films.list.length,
                              itemBuilder: (_, i) => GestureDetector(
                                onTap: () {
                                  print('movie: ${films.list[i].title}');
                                },
                                child: ListTile(
                                  title: Text(films.list[i].title),
                                ),
                              ),
                            ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // return Consumer<ListaFilms>()
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista Pelìculas'),
        ),
        //TODO agregar accion para buscar películas
        body: bodyListPelis(context));
  }
}

// Widget materialListMovies() {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Lista Películas'),
//     ),
//     // TODO add drawer
//     //drawer: AppDrawer(),
//     body: Consumer<ListaFilms>{

//     },
//   );
// }

// TODO revisar si se quita esto
// class BodyLayout extends StatefulWidget {
//   @override
//   _BodyLayoutState createState() => _BodyLayoutState();
// }

// class _BodyLayoutState extends State<BodyLayout> {
//   Future _myList(url) async {
//     _list.clear();
//     try {
//       Uri link = Uri.parse(url);
//       print(url);
//       var respuesta = await http.get(link);
//       var temp =
//           jsonDecode(respuesta.body)['_embedded']['films'] as List<dynamic>;
//       for (int i = 0; i < temp.length; i++) {
//         _list.add(
//           kWidget(
//             temp[i]['title'],
//             temp[i]['description'],
//             temp[i]['date'],
//             () {
//               if (getUid() != null) {
//                 setState(() {
//                   //_showMyDialog(_context);
//                 });
//                 //  kShowMyDialogMovie(getUid(), temp[i]['title'], temp[i]['id'], _context);
//               }
//             },
//           ),
//         );
//       }
//       return _list;
//     } catch (e) {
//       print(e);
//       return _list;
//     }
//   }

//   Future _showMyDialog(BuildContext context) async {
//     return showDialog(
//       context: context,
//       builder: (_) => _buildAlertDialog(),
//     );
//   }

//   Widget _buildAlertDialog() {
//     return AlertDialog(
//       title: Text('Notificaciones'),
//       content:
//           Text("¿Desea recibir notificaciones? Serán muy pocas de verdad :)"),
//       actions: [
//         FlatButton(
//             child: Text("Aceptar"),
//             textColor: Colors.blue,
//             onPressed: () {
//               Navigator.of(context).pop();
//             }),
//         FlatButton(
//             child: Text("Cancelar"),
//             textColor: Colors.red,
//             onPressed: () {
//               Navigator.of(context).pop();
//             }),
//       ],
//     );
//   }

//   // Future kShowMyDialogMovie(idUs, title, id, _MyContext) async {
//   //   return showDialog<void>(
//   //     context: _MyContext,
//   //     barrierDismissible: false, // user must tap button!
//   //     builder: (BuildContext context) {
//   //       return AlertDialog(
//   //         title: Text('$title'),
//   //         content: SingleChildScrollView(
//   //           child: ListBody(
//   //             children: <Widget>[
//   //               FloatingActionButton(
//   //                 child: const Icon(Icons.play_arrow),
//   //                 onPressed: () {
//   //                   print('lets to see the movie! $title');
//   //                 },
//   //               ),
//   //               kFlatButtonMovie(idUs, 'Views', id),
//   //               kFlatButtonMovie(idUs, 'To see', id),
//   //               kFlatButtonMovie(idUs, 'Favorite', id),
//   //               kFlatButtonMovie(idUs, 'Available cinema', id)
//   //             ],
//   //           ),
//   //         ),
//   //         actions: <Widget>[
//   //           TextButton(
//   //             child: Text('Cerrar'),
//   //             onPressed: () {
//   //               Navigator.of(context).pop();
//   //             },
//   //           ),
//   //         ],
//   //       );
//   //     },
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       builder: (context, projectSnap) {
//         if (projectSnap.connectionState == ConnectionState.none &&
//             projectSnap.hasData == null) {
//           return Container();
//         }
//         return kMyListView(() {
//           setState(() {
//             urlDesigned = '$url_get_movie_from_title$_keyWord';
//           });
//         });
//       },
//       future: _myList(urlDesigned),
//     );
//   }
// }

// Widget kMyListView(@required onClick) {
//   return Column(
//     children: <Widget>[
//       Center(
//         child: Container(
//           child: Column(
//             children: <Widget>[
//               Container(
//                 padding: EdgeInsets.all(15),
//                 child: TextField(
//                   onChanged: (value) {
//                     _keyWord = value;
//                     //print(_keyWord);
//                   },
//                 ),
//               ),
//               FloatingActionButton(
//                 child: Icon(Icons.search),
//                 onPressed: onClick,
//               ),
//               Container(
//                 padding: EdgeInsets.all(5),
//                 child: Column(
//                   children: <Widget>[..._list],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     ],
//   );
// }
