import 'package:example/service/mp/user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MPPointService {
  static addPoint({
    required double point,
    required double total,
  }) async {
    await FirebaseFirestore.instance.collection("points").add({
      "point": point,
      "total": total,
      "user": MDUserService.getUserData(),
    });
    print("Add point success!");

    await MDUserService.updatePoint(
      point: point,
    );

    print("Update point success!");
  }
}
