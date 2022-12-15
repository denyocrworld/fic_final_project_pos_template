import 'package:flutter/material.dart';
import 'package:example/core.dart';
import '../controller/point_history_controller.dart';

class PointHistoryView extends StatefulWidget {
  const PointHistoryView({Key? key}) : super(key: key);

  Widget build(context, PointHistoryController controller) {
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
  State<PointHistoryView> createState() => PointHistoryController();
}
