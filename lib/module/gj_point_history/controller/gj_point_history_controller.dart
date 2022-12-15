import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/gj_point_history_view.dart';

class GjPointHistoryController extends State<GjPointHistoryView> implements MvcController {
  static late GjPointHistoryController instance;
  late GjPointHistoryView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}