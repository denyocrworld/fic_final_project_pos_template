import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/category_list_view.dart';

class CategoryListController extends State<CategoryListView>
    implements MvcController {
  static late CategoryListController instance;
  late CategoryListView view;

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
