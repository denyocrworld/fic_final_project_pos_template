import 'package:dio/dio.dart';

class TkposService {
  static deleteProduct(Map item) async {
    var id = item["id"];
    var response = await Dio().delete(
      "http://capekngoding.com:8080/denis/api/products/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    print(response.statusCode);
  }

  static getProductList() async {
    var response = await Dio().get(
      "http://capekngoding.com:8080/denis/api/products",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj["data"];
  }

  static add({
    required String photo,
    required String productName,
    required double price,
    required String description,
  }) async {
    var response = await Dio().post(
      "http://capekngoding.com:8080/denis/api/products",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "photo": photo,
        "product_name": productName,
        "price": price,
        "description": description,
      },
    );
    Map obj = response.data;
  }

  static update({
    required int id,
    required String photo,
    required String productName,
    required double price,
    required String description,
  }) async {
    var response = await Dio().post(
      "http://capekngoding.com:8080/denis/api/products/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "photo": photo,
        "product_name": productName,
        "price": price,
        "description": description,
      },
    );
    Map obj = response.data;
  }
}
