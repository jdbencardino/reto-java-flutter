import 'package:flutter/material.dart';
import 'package:peliculas_flutter/screens/regUser.dart';
import 'screens/mainScreen.dart';
import 'screens/noRegUsScreen.dart';
import 'screens/mainScreenInside.dart';
import 'constantes.dart';
import 'screens/logUser.dart';

// inicia la aplicacion
void main() {
  runApp(MyApp());
}

// construlle un objeto tipo MaterialApp
MaterialApp materialApp = MaterialApp(
  routes: {
    mainScreenId: (context) => MainScreen(),
    noRegUsScreen: (context) => NoRegUsScreen(),
    mainScreenInside: (context) => MainScreenInside(),
    logUser: (context) => LogUser(),
    regUser: (context) => RegUser()
  },
);

// construye el enrutador y el Widget sin estado
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: mainScreenId,
      routes: {
        mainScreenId: (context) => MainScreen(),
        noRegUsScreen: (context) => NoRegUsScreen(),
        mainScreenInside: (context) => MainScreenInside(),
        logUser: (context) => LogUser(),
        regUser: (context) => RegUser()
      },
    );
  }
}
