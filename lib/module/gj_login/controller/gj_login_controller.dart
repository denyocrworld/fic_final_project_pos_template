import 'package:example/core.dart';
import 'package:flutter/material.dart';

class GjLoginController extends State<GjLoginView> implements MvcController {
  static late GjLoginController instance;
  late GjLoginView view;

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
    var isSuccess = await MPAuthService.doLoginAsMember();
    if (isSuccess) {
      Get.offAll(const GjMainNavigationView());
    }
  }

  doLoginAsVendor() async {
    var isSuccess = await MPAuthService.doLoginAsVendor();
    if (isSuccess) {
      Get.offAll(const GjMainNavigationView());
    }
  }
}
