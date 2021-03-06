import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_flutter/screens/mainScreenAdmin.dart';
import 'package:peliculas_flutter/screens/mainScreenCine.dart';
import 'package:peliculas_flutter/screens/mainScreenSub.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'providers/lista_films.dart';
import 'screens/logAdmin.dart';
import 'screens/logCine.dart';
import 'screens/regUser.dart';
import 'screens/mainScreen.dart';
import 'screens/noRegUsScreen.dart';
import 'screens/logUser.dart';
import 'helpers/constantes.dart';
import 'screens/mainScreenSub.dart';
import 'screens/mainScreenCine.dart';
import 'screens/mainScreenAdmin.dart';

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
  @override
  Widget build(BuildContext context) {
    //FirebaseAuth mAuth = FirebaseAuth.instance;
    //mAuth != null ? Navigator.pushNamed(context, Mains): print('not is user');
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
        initialRoute: mainScreenId,
        routes: {
          mainScreenId: (context) => MainScreen(),
          noRegUsScreen: (context) => NoRegUsScreen(),
          logUser: (context) => LogUser(),
          logCine: (context) => LogCine(),
          logAdmin: (context) => LogAdmin(),
          regUser: (context) => RegUser(),
          mainScreenSub: (context) => MainScreenSub(),
          mainScreenCine: (context) => MainScreenCine(),
          mainScreenAdmin: (context) => MainScreenAdmin()
        },
      ),
    );
  }
}
