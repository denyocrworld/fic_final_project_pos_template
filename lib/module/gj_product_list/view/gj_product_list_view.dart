import 'package:flutter/material.dart';
import 'package:example/core.dart';
import '../controller/gj_product_list_controller.dart';

class GjProductListView extends StatefulWidget {
  const GjProductListView({Key? key}) : super(key: key);

  Widget build(context, GjProductListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("GjProductList"),
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
  State<GjProductListView> createState() => GjProductListController();
}