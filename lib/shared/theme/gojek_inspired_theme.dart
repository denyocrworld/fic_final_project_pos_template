import 'package:example/core.dart';
import 'package:flutter/material.dart';

class CurrentTheme {
  static const mainColor = Color(0xff00880c);
  static const scaffoldBackgroundColor = Colors.white;
  static const cardColor = Color(0xff0081a0);
  static const buttonColor = Color(0xff00a5cf);
  static const textColor = Color(0xff1b1b1b);
  static var fontFamily = GoogleFonts.roboto();

  static const cardBorderRadius = 12.0;
}

ThemeData getGojekTheme() {
  return ThemeData().copyWith(
    primaryColor: CurrentTheme.mainColor,
    // primarySwatch:  Color(0xffFA533C),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: CurrentTheme.buttonColor,
        // shape: ContinuousRectangleBorder(
        //   borderRadius: BorderRadius.circular(64.0),
        // ),
        shape: const StadiumBorder(),
        foregroundColor: Colors.white,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.6,
      titleTextStyle: GoogleFonts.montserrat(
        color: CurrentTheme.textColor,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
        color: CurrentTheme.textColor,
      ),
    ),
    scaffoldBackgroundColor: CurrentTheme.scaffoldBackgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      // backgroundColor: Color(0xff26354F),
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey[400],
      selectedItemColor: CurrentTheme.mainColor,
    ),
    // drawerTheme: DrawerThemeData(
    //   backgroundColor: drawerBackgroundColor,
    // ),
    // iconTheme: IconThemeData(
    //   color: fontColor,
    // ),
    listTileTheme: const ListTileThemeData(
      selectedColor: Colors.red,
    ),
    // textTheme: TextTheme(
    //   bodyText1: CurrentTheme.fontFamily.copyWith(
    //     color: CurrentTheme.textColor,
    //   ),
    //   bodyText2: CurrentTheme.fontFamily.copyWith(
    //     color: CurrentTheme.textColor,
    //   ),
    //   headline1: CurrentTheme.fontFamily.copyWith(
    //     color: CurrentTheme.textColor,
    //   ),
    //   headline2: CurrentTheme.fontFamily.copyWith(
    //     color: CurrentTheme.textColor,
    //   ),
    //   headline3: CurrentTheme.fontFamily.copyWith(
    //     color: CurrentTheme.textColor,
    //   ),
    //   headline4: CurrentTheme.fontFamily.copyWith(
    //     color: CurrentTheme.textColor,
    //   ),
    //   displaySmall: CurrentTheme.fontFamily.copyWith(
    //     color: CurrentTheme.textColor,
    //   ),
    //   displayMedium: CurrentTheme.fontFamily.copyWith(
    //     color: CurrentTheme.textColor,
    //   ),
    //   displayLarge: CurrentTheme.fontFamily.copyWith(
    //     color: CurrentTheme.textColor,
    //   ),
    // ),
    cardTheme: CardTheme(
      elevation: cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CurrentTheme.cardBorderRadius),
      ),
    ),
    // chipTheme: const ChipThemeData(),
    // tabBarTheme: TabBarTheme(
    //   labelColor: fontColor,
    // ),
  );
}
