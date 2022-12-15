import 'package:example/core.dart';
import 'package:flutter/material.dart';

class GjProfileController extends State<GjProfileView>
    implements MvcController {
  static late GjProfileController instance;
  late GjProfileView view;

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
    await MPAuthService.doLogout();
    Get.offAll(const GjLoginView());
  }
}
