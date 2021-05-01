import 'package:peliculas_flutter/models/user.dart';

class Admin extends User {
  static const roleName = 'admin';

  Admin(
    id,
    username,
    uid,
    name,
    surname,
    email,
  ) : super(
          id,
          username,
          uid,
          name,
          surname,
          email,
        );
}
