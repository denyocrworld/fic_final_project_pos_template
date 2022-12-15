import 'package:example/core.dart';
import 'package:flutter/material.dart';

class ThemeService {
  static int selectedIndex = 0;

  static List themeList = [
    getLightTheme(),
    getDarkTheme(),
    getOrangeTheme(),
  ];

  static ThemeData get theme {
    return themeList[selectedIndex];
  }

  static save(int index) async {
    await mainStorage.put("theme", index);
    ThemeService.selectedIndex = index;
  }

  static load() async {
    ThemeService.selectedIndex = await mainStorage.get("theme") ?? 0;
  }
}
