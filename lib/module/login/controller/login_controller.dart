import 'package:example/core.dart';
import 'package:flutter/material.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  doLoginAsMember() async {
    var isSuccess = await AuthService.doLoginAsMember();
    if (isSuccess) {
      Get.offAll(const MainNavigationView());
    }
  }

  doLoginAsVendor() async {
    var isSuccess = await AuthService.doLoginAsVendor();
    if (isSuccess) {
      Get.offAll(const MainNavigationView());
    }
  }
}
