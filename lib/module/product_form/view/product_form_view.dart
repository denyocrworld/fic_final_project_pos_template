import 'package:flutter/material.dart';
import 'package:example/core.dart';
import '../controller/product_form_controller.dart';

class ProductFormView extends StatefulWidget {
  const ProductFormView({Key? key}) : super(key: key);

  Widget build(context, ProductFormController controller) {
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
  State<ProductFormView> createState() => ProductFormController();
}
