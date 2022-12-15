import 'dart:math';
import 'package:dio/dio.dart';

class ProductExampleService {
  static Future<Map> getProducts() async {
    var response = await Dio().get(
      "http://192.168.1.6:8080/deny/api/products",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj;
  }

  static create({
    required String photo,
    required String productName,
    required double price,
    required String description,
  }) async {
    var response = await Dio().post(
      "http://192.168.1.6:8080/deny/api/products",
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
  }

  static update({
    required int id,
    required String photo,
    required String productName,
    required double price,
    required String description,
  }) async {
    var response = await Dio().post(
      "http://192.168.1.6:8080/deny/api/products/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        // "photo": randomPhoto,
        "product_name": productName,
        "price": price,
        "description": description,
      },
    );
  }

  static delete(dynamic id) async {
    var response = await Dio().delete(
      "http://192.168.1.6:8080/deny/api/products/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }

  static String get randomPhoto {
    List images = [
      "https://i.ibb.co/rHg3M1p/photo-1503508343067-c4103b7140b3-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/7gWtJrM/photo-1517481705099-72660903e569-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/Q9P0Twh/photo-1495624423019-fdbb969dd0fe-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/cykDvTw/photo-1476270874743-4db8ec55dd69-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "https://i.ibb.co/yY2bXgC/photo-1530982011887-3cc11cc85693-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
    ];
    images.shuffle();
    return images.first;
  }

  static generateProducts() async {
    var response = await Dio().post(
      "http://192.168.1.6:8080/deny/api/products",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "photo": randomPhoto,
        "product_name": "Product ${Random().nextInt(100)}",
        "price": Random().nextInt(100),
        "description": "-",
      },
    );
  }
}
