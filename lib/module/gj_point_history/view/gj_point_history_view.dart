import 'package:flutter/material.dart';
import 'package:example/core.dart';
import '../controller/gj_point_history_controller.dart';

class GjPointHistoryView extends StatefulWidget {
  const GjPointHistoryView({Key? key}) : super(key: key);

  Widget build(context, GjPointHistoryController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("GjPointHistory"),
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
  State<GjPointHistoryView> createState() => GjPointHistoryController();
}