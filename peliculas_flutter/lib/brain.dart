import 'package:shared_preferences/shared_preferences.dart';

Future<String> getIdFromShared(String key) async {
  var prefs = await SharedPreferences.getInstance();
  await prefs.getString(key);
}
