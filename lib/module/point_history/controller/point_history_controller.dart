import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/point_history_view.dart';

class PointHistoryController extends State<PointHistoryView>
    implements MvcController {
  static late PointHistoryController instance;
  late PointHistoryView view;

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
