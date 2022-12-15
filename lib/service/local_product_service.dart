import 'package:example/core.dart';

class LocalProductService {
  static List products = [];

  static save() async {
    await mainStorage.put("products", products);
  }

  static load() async {
    products = await mainStorage.get("products") ?? [];
  }

  static add(Map newProduct) async {
    products.add(newProduct);
    await save();
  }

  static delete(Map product) async {
    products.remove(product);
    await save();
  }

  static update(int index, Map newProduct) async {
    products[index] = newProduct;
    await save();
  }
}
