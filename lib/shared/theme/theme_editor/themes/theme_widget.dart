import 'package:example/core.dart';
import 'package:flutter/material.dart';

class ThemeWidget {}

extension WidgetExtension on Widget {
  xs() {
    return SizedBox(
      width: wxs,
      height: wxs,
      child: FittedBox(
        child: this,
      ),
    );
  }

  sm() {
    return SizedBox(
      width: wsm,
      height: wsm,
      child: FittedBox(
        child: this,
      ),
    );
  }

  md() {
    return SizedBox(
      width: wmd,
      height: wmd,
      child: FittedBox(
        child: this,
      ),
    );
  }

  lg() {
    return SizedBox(
      width: wlg,
      height: wlg,
      child: FittedBox(
        child: this,
      ),
    );
  }

  xl() {
    return SizedBox(
      width: wxl,
      height: wxl,
      child: FittedBox(
        child: this,
      ),
    );
  }

  Widget fullWidth() {
    return SizedBox(
      width: MediaQuery.of(globalContext).size.width,
      child: this,
    );
  }

  Widget fw90() {
    return FittedBox(
      child: SizedBox(
        width: 2000,
        height: 120,
        child: FittedBox(
          child: this,
        ),
      ),
    );
  }

  Widget fw30() {
    return SizedBox(
      width: MediaQuery.of(globalContext).size.width,
      height: 30,
      child: FittedBox(
        child: this,
      ),
    );
  }

  Widget h90() {
    return SizedBox(
      height: 90,
      child: this,
    );
  }

  Widget h30() {
    return SizedBox(
      height: 30,
      child: this,
    );
  }

  Widget h40() {
    return SizedBox(
      height: 40,
      child: this,
    );
  }

  Widget fit() {
    return FittedBox(
      child: this,
    );
  }
}
