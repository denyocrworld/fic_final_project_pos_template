import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/gj_category_list_view.dart';

class GjCategoryListController extends State<GjCategoryListView> implements MvcController {
  static late GjCategoryListController instance;
  late GjCategoryListView view;

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