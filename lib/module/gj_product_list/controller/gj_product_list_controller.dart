import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/gj_product_list_view.dart';

class GjProductListController extends State<GjProductListView> implements MvcController {
  static late GjProductListController instance;
  late GjProductListView view;

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