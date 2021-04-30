import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:peliculas_flutter/httpRequest.dart';
import 'package:peliculas_flutter/screens/logAdmin.dart';
import 'package:peliculas_flutter/screens/logCine.dart';
import 'package:peliculas_flutter/screens/regUser.dart';
import 'screens/mainScreen.dart';
import 'screens/noRegUsScreen.dart';
import 'screens/mainScreenInside.dart';
import 'constantes.dart';
import 'screens/logUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

MaterialApp materialApp = MaterialApp(
  routes: {
    mainScreenId: (context) => MainScreen(),
    noRegUsScreen: (context) => NoRegUsScreen(),
    mainScreenInside: (context) => MainScreenInside(),
    logUser: (context) => LogUser(),
    logCine: (context) => LogCine(),
    logAdmin: (context) => LogAdmin(),
    regUser: (context) => RegUser()
  },
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initialRouteX = mainScreenId;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: mainScreenId,
      routes: {
        mainScreenId: (context) => MainScreen(),
        noRegUsScreen: (context) => NoRegUsScreen(),
        mainScreenInside: (context) => MainScreenInside(),
        logUser: (context) => LogUser(),
        logCine: (context) => LogCine(),
        logAdmin: (context) => LogAdmin(),
        regUser: (context) => RegUser()
      },
    );
  }
}
