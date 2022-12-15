import 'package:flutter/material.dart';
import 'package:example/core.dart';
import '../controller/gj_category_list_controller.dart';

class GjCategoryListView extends StatefulWidget {
  const GjCategoryListView({Key? key}) : super(key: key);

  Widget build(context, GjCategoryListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("GjCategoryList"),
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
  State<GjCategoryListView> createState() => GjCategoryListController();
}