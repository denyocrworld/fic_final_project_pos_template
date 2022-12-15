import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/service/user_service.dart';

class PointService {
  static addPoint({
    required double point,
    required double total,
  }) async {
    await FirebaseFirestore.instance.collection("points").add({
      "point": point,
      "total": total,
      "user": UserService.getUserData(),
    });
    print("Add point success!");

    await UserService.updatePoint(
      point: point,
    );

    print("Update point success!");
  }
}
