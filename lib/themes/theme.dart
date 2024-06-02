import 'package:flutter/material.dart';
import 'package:troover_admin/themes/colors.dart';

class CustomTheme {
  static const boldText = TextStyle(fontWeight: FontWeight.bold);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: ColorTheme.primaryColor.light, // also the 'primary' color
    ).copyWith(
      // onPrimary: ColorTheme.textColor.light,
      secondary: ColorTheme.secondaryColor.light,
      // surface: ColorTheme.secondaryColor.light,
      // onSurface: ColorTheme.textColor.dark,  // Written on a surface
      onSurfaceVariant: ColorTheme
          .textColorVariant.light, // Written on other surfaces + icons?
      background: ColorTheme.secondaryColorVariant.light,
      // onBackground: ColorTheme.textColor.dark,
    ),
    splashColor: ColorTheme.secondaryColor.light,
    splashFactory: NoSplash.splashFactory,
    cardTheme: CardTheme(
      color: ColorTheme.secondaryColorVariant.light,
      elevation: 2.0,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      toolbarTextStyle: boldText,
      foregroundColor: ColorTheme.textColor.light,
      backgroundColor: ColorTheme.navigationBar.light,
    ),
    // textTheme: ThemeData.light().textTheme.apply(
    //       bodyColor: ColorTheme.textColor.dark,
    //       displayColor: ColorTheme.textColor.dark,
    //     ),
    navigationRailTheme: NavigationRailThemeData(
      useIndicator: true,
      backgroundColor: ColorTheme.navigationBar.light,
      selectedIconTheme: IconThemeData(color: ColorTheme.textColor.light),
      indicatorColor: ColorTheme.secondaryColor.light,
      selectedLabelTextStyle: boldText,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorTheme.navigationBar.light,
      selectedItemColor: ColorTheme.textColor.light,
      unselectedItemColor: ColorTheme.textColorVariant.light,
      showUnselectedLabels: false,
      selectedLabelStyle: boldText,
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: boldText,
      labelColor: ColorTheme.textColor.light,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    // appBarTheme: AppBarTheme(color: ColorTheme.systemBar.dark),
    colorSchemeSeed: ColorTheme.primaryColor.dark,
    // // primaryColor: ColorTheme.primaryColor.dark,
    // bannerTheme: MaterialBannerThemeData(
    //   backgroundColor: ColorTheme.systemBar.dark,
    // ),

    // colorScheme: const ColorScheme.dark().copyWith(
    //   primary: ColorTheme.primaryColor.dark,
    //   onPrimary: ColorTheme.onPrimary.dark,
    //   primaryContainer: ColorTheme.primaryVariant.dark,
    //   secondary: ColorTheme.secondaryColor.dark,
    //   secondaryContainer: ColorTheme.secondaryVariant.dark,
    //   background: ColorTheme.background.dark,
    //   surface: ColorTheme.systemBar.dark,
    //   tertiary: ColorTheme.textColor.dark,
    //   tertiaryContainer: ColorTheme.textVariant.dark,
    // ),
  );
}

CustomTheme _themeClass = CustomTheme();
