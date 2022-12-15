import 'package:flutter/material.dart';
import 'package:example/core.dart';
import '../controller/gj_product_form_controller.dart';

class GjProductFormView extends StatefulWidget {
  const GjProductFormView({Key? key}) : super(key: key);

  Widget build(context, GjProductFormController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("GjProductForm"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<GjProductFormView> createState() => GjProductFormController();
}