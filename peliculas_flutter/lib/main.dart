import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'providers/lista_films.dart';
import 'screens/logAdmin.dart';
import 'screens/logCine.dart';
import 'screens/regUser.dart';
import 'screens/mainScreen.dart';
import 'screens/noRegUsScreen.dart';
import 'screens/mainScreenInside.dart';
import 'screens/logUser.dart';
import 'helpers/constantes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// MaterialApp materialApp = MaterialApp(
//   routes: {
//     mainScreenId: (context) => MainScreen(),
//     noRegUsScreen: (context) => NoRegUsScreen(),
//     mainScreenInside: (context) => MainScreenInside(),
//     logUser: (context) => LogUser(),
//     logCine: (context) => LogCine(),
//     logAdmin: (context) => LogAdmin(),
//     regUser: (context) => RegUser()
//   },
// );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initialRouteX = mainScreenId;

  @override
  Widget build(BuildContext context) {
    // isUser();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ListaFilms(),
        ),
      ],
      child: MaterialApp(
        title: 'Mis Pelis',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.orange,
        ),
        initialRoute: initialRouteX,
        routes: {
          mainScreenId: (context) => MainScreen(),
          noRegUsScreen: (context) => NoRegUsScreen(),
          mainScreenInside: (context) => MainScreenInside(),
          logUser: (context) => LogUser(),
          logCine: (context) => LogCine(),
          logAdmin: (context) => LogAdmin(),
          regUser: (context) => RegUser()
        },
      ),
    );
  }
}
