import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/gj_product_form_view.dart';

class GjProductFormController extends State<GjProductFormView> implements MvcController {
  static late GjProductFormController instance;
  late GjProductFormView view;

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