import 'package:peliculas_flutter/models/user.dart';

class Cine extends User {
  static const roleName = 'cine';

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
