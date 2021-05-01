import 'package:peliculas_flutter/models/user.dart';

class Suscriber extends User {
  static const roleName = 'subscriber';

  String points;

  Suscriber(
    id,
    username,
    uid,
    name,
    surname,
    email,
    this.points,
  ) : super(
          id,
          username,
          uid,
          name,
          surname,
          email,
        );
}
