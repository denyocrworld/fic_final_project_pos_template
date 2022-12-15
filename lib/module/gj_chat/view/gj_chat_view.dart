import 'package:flutter/material.dart';
import 'package:example/core.dart';
import '../controller/gj_chat_controller.dart';

class GjChatView extends StatefulWidget {
  const GjChatView({Key? key}) : super(key: key);

  Widget build(context, GjChatController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("GjChat"),
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
  State<GjChatView> createState() => GjChatController();
}