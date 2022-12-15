import 'package:example/shared/theme/theme_config.dart';
import 'package:flutter/material.dart';

ThemeData getDarkTheme() {
  return ThemeData.dark().copyWith(
    // primarySwatch:  Color(0xffFA533C),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     shape: ContinuousRectangleBorder(
    //       borderRadius: BorderRadius.circular(64.0),
    //     ),
    //     foregroundColor: Colors.white,
    //   ),
    // ),
    // appBarTheme: AppBarTheme(
    //   backgroundColor: appbarBackgroundColor,
    //   elevation: 0.6,
    //   titleTextStyle: googleFont.copyWith(
    //     color: Colors.blueGrey[700],
    //     fontWeight: FontWeight.bold,
    //   ),
    //   iconTheme: IconThemeData(
    //     color: Colors.blueGrey[700],
    //   ),
    // ),
    // scaffoldBackgroundColor: scaffoldBackgroundColor,
    // drawerTheme: DrawerThemeData(
    //   backgroundColor: drawerBackgroundColor,
    // ),
    // iconTheme: IconThemeData(
    //   color: fontColor,
    // ),
    // textTheme: TextTheme(
    //   bodyText1: googleFont.copyWith(
    //     color: fontColor,
    //   ),
    //   bodyText2: googleFont.copyWith(
    //     color: fontColor,
    //   ),
    // ),
    cardTheme: CardTheme(
      elevation: cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
    ),
    // chipTheme: const ChipThemeData(),
    // tabBarTheme: TabBarTheme(
    //   labelColor: fontColor,
    // ),
  );
}
