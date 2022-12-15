import 'package:example/core.dart';
import 'package:flutter/material.dart';

class ProfileController extends State<ProfileView> implements MvcController {
  static late ProfileController instance;
  late ProfileView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  doLogout() async {
    await AuthService.doLogout();
    Get.offAll(const LoginView());
  }
}
