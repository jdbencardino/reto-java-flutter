class ApiHelper {
  // Rutas http
  static const url_get_users = 'http://localhost:8080/users';
  static const url_get_movies = 'http://localhost:8080/films';
  static const url_get_movie_from_title =
      'http://localhost:8080/films/search/findByTitleContaining?title=';
  static const url_get_subscriber_by_id =
      'http://localhost:8080/subscribers/search/findByUid?uid=';
  static const url_get_admin_by_id =
      'http://localhost:8080/admins/search/findByUid?uid=';
}
