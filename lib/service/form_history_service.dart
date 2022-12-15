import 'package:example/core.dart';

class FormHistoryService {
  static String name = "";
  static String address = "";

  static save({
    required String name,
    required String address,
  }) async {
    mainStorage.put("name", name);
    mainStorage.put("address", address);
    FormHistoryService.name = name;
    FormHistoryService.address = address;
  }

  static load() async {
    name = mainStorage.get("name") ?? "";
    address = mainStorage.get("address") ?? "";
  }
}
