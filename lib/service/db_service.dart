import "package:hive/hive.dart";

late Box mainStorage;

example() {
  mainStorage.put("theme", 1);
  mainStorage.get("theme");
}
