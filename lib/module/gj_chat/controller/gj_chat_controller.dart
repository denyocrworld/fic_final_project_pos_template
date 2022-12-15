import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/gj_chat_view.dart';

class GjChatController extends State<GjChatView> implements MvcController {
  static late GjChatController instance;
  late GjChatView view;

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