import 'package:flutter/material.dart';
import 'package:example/core.dart';
import '../controller/chat_controller.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  Widget build(context, ChatController controller) {
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
  State<ChatView> createState() => ChatController();
}
