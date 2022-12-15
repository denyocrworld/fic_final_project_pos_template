class AppConfig {
  //# CONFIG
  static String yourName = "DenyOcr";
  static String phoneNumber = "082146727433";
  //# ---------------------------------------
  //# ---------------------------------------

  static String get baseUrl {
    var storage = yourName.replaceAll(" ", "-").toLowerCase();
    storage = "$storage-$phoneNumber";
    return "http://capekngoding.com:8080/$storage/api";
  }
}
