import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/gj_main_navigation_view.dart';

class GjMainNavigationController extends State<GjMainNavigationView>
    implements MvcController {
  static late GjMainNavigationController instance;
  late GjMainNavigationView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  int selectedIndex = 0;
}
