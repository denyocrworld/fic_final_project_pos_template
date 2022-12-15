import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/chat_view.dart';

class ChatController extends State<ChatView> implements MvcController {
  static late ChatController instance;
  late ChatView view;

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
