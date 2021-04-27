import 'package:shared_preferences/shared_preferences.dart';

void setData(String data, String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, data);
}

Future<String> getData(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.getString(key).toString();
}
