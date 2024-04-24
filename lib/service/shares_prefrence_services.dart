import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static Future<SharedPreferences> getInstance() async {
    return await SharedPreferences.getInstance();
  }

  static Future<void> storeToken(String token) async {
    final prefs = await getInstance();
    prefs.setString('token', token);
  }

  static Future<String?> getToken() async {
    final prefs = await getInstance();
    return prefs.getString('token');
  }

  static Future<void> removeToken() async {
    final prefs = await getInstance();
    prefs.remove('token');
  }
}
