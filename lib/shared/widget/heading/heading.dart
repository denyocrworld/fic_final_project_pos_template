import 'package:flutter/material.dart';

getText({
  required String text,
  required double fontSize,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
    ),
  );
}

H1(text) => getText(text: text, fontSize: 30);
H2(text) => getText(text: text, fontSize: 24);
H3(text) => getText(text: text, fontSize: 20);
H4(text) => getText(text: text, fontSize: 18);
H5(text) => getText(text: text, fontSize: 16);
H6(text) => getText(text: text, fontSize: 14);
