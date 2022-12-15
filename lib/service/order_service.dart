import 'package:example/core.dart';

class OrderService {
  static List products = [];
  static init() {
    products = List.from(ProductService.products);
  }

  static double get total {
    double total = 0.0;
    for (var i = 0; i < products.length; i++) {
      var item = products[i];
      item["qty"] = item["qty"] ?? 0;
      total += item["qty"] * item["price"];
    }
    return total;
  }
}
