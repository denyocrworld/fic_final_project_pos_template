import 'db_service.dart';

class UserService {
  static String? token = "";

  static load() async {
    token = mainStorage.get("token");
  }

  static save(String key, String? token) async {
    mainStorage.put("token", token);
    UserService.token = token;
  }
}
// VISUAL STUDIO 2019
// C++ Desktop

// SQL atau NoSQL
// SQL => SQFLITE
// NO SQL => shared_preferences , hive
