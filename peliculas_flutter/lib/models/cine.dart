import 'package:peliculas_flutter/models/user.dart';

class Cine extends User {
  String web, address;

  Cine(
    id,
    username,
    uid,
    name,
    surname,
    email,
    this.web,
    this.address,
  ) : super(
          id,
          username,
          uid,
          name,
          surname,
          email,
        );
}
