// Rutas http
import 'package:peliculas_flutter/itemsScreen/user.dart';

const String url_get_movies = 'http://localhost:8080/films';
const String url_get_users = 'http://localhost:8080/users';
const String url_get_movie_from_title =
    'http://localhost:8080/films/search/findByTitleContaining?title=';
const String delete_user_by_uid =
    'http://localhost:8080/users/search/deleteByUid?uid=';

//Rutas de navegacion
// TODO remover esto
const String mainScreenId = '/';
const String noRegUsScreen = '/noRegUsScreen';
const String mainScreenInside = '/mainScreenInside';
const String logUser = '/logUser';
const String logCine = '/logCine';
const String logAdmin = '/logAdmin';
const String regUser = '/regUser';

const userUserName = "USERUSERNAME";
const userName = 'USERNAME';
const userId = 'USERID';
const userAccessLevel = 'USERACCESSLEVEL';
const userEmail = 'USEREMAIL';
const userPoints = 'USEREMAIL';
const userSurname = 'USEREMAIL';
const userUid = 'USEREMAIL';

Suscriber user_suscriber;
