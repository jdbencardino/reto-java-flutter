import 'package:flutter/material.dart';
import 'screens/mainScreen.dart';
import 'screens/noRegUsScreen.dart';
import 'constantes.dart';

void main() {
  runApp(MyApp());
}

MaterialApp materialApp = MaterialApp(
  routes: {
    mainScreenId: (context) => MainScreen(),
    noRegUsScreen: (context) => NoRegUsScreen()
  },
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: noRegUsScreen,
      routes: {
        mainScreenId: (context) => MainScreen(),
        noRegUsScreen: (context) => NoRegUsScreen(),
      },
    );
  }
}
