import 'dart:convert';
import 'dart:developer';

import 'package:example/core.dart';
import 'package:flutter/material.dart';

class DashboardController extends State<DashboardView>
    implements MvcController {
  static late DashboardController instance;
  late DashboardView view;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
    super.initState();
  }

  void onReady() async {
    await Future.delayed(const Duration(milliseconds: 600));
    addListenerToScrollController();
  }

  int selectedIndex = 0;
  updateIndex(newIndex) {
    selectedIndex = newIndex;
    if (selectedIndex == 0) {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 900),
        curve: Curves.ease,
      );
    } else {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 900),
        curve: Curves.ease,
      );
    }
    setState(() {});
  }

  addListenerToScrollController() {
    scrollController.addListener(() {
      var offset = scrollController.offset;
      var maxScrollExtent = scrollController.position.maxScrollExtent;

      print("offset: $offset");
      print("maxScrollExtent: $maxScrollExtent");

      if (offset >= maxScrollExtent / 2) {
        selectedIndex = 1;
      } else {
        selectedIndex = 0;
      }
      setState(() {});
    });

    var maxScrollExtent = scrollController.position.maxScrollExtent;
    selectedIndex = 1;
    setState(() {});
    scrollController.animateTo(
      maxScrollExtent,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  scanQrCode() async {
    var qrCode = await showQrcodeScanner();
    var obj = jsonDecode(qrCode);
    log(obj.toString());
    log(obj.toString());

    await PointService.addPoint(
      point: double.parse("${obj["point"] ?? 0}"),
      total: double.parse("${obj["total"] ?? 0}"),
    );
    showInfoDialog("Your order is success!!!\n $qrCode");
  }
}
