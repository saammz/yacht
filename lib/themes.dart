import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme(BuildContext context) {
  Color scaffoldColor = const Color(0xFFFAF9F6);
  Color mainColor = const Color(0xFF0A2472);
  Color cardColor = const Color(0xFFFFFFFF);

  return ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: scaffoldColor,
    primaryColorLight: scaffoldColor,
    dialogBackgroundColor: cardColor,
    appBarTheme: Theme.of(context).appBarTheme.copyWith(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: const Color(
            0xFF0F111A,
          ),
        ),
    primarySwatch: Platform.isAndroid ? null : Colors.blue,
    primaryColor: Theme.of(context).scaffoldBackgroundColor,
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: const Color(0x00f8f8f8),
      errorColor: const Color(0xFFEB5757),
    ),
    iconTheme: const IconThemeData(
      color: Color(
        0xFF7D7D80,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(color: mainColor),
        enableFeedback: false,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: scaffoldColor,
      colorScheme: ColorScheme.fromSwatch(
        backgroundColor: scaffoldColor,
      ),
    ),
    focusColor: const Color(0xFFDEDEDE),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    cardColor: cardColor,
    tabBarTheme: TabBarTheme(
        labelColor: const Color(0xFF0F111A),
        indicator: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: mainColor, width: 1.7),
        ))),
    listTileTheme: Theme.of(context).listTileTheme.copyWith(
          iconColor: const Color(0xFF585859),
          textColor: const Color(0xFF585859),
          selectedTileColor: const Color(0xFFFAFAFC),
          tileColor: scaffoldColor,
        ),
    splashColor: const Color(0xFFD9EBFA),
    badgeTheme: const BadgeThemeData(textColor: Color(0xFFFEC89A)),
    disabledColor: const Color(0xFFC6C3C3),
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: Color(0xFF84E3C8)),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        letterSpacing: 2,
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: Color(
          0xFF585859,
        ),
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: Color(
          0xFF585859,
        ),
      ),
      titleSmall: TextStyle(
        letterSpacing: 2,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Color(
          0xFF585859,
        ),
      ),
      titleMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Color(
          0xFF585859,
        ),
      ),
    ),
    inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
          contentPadding: const EdgeInsets.symmetric(horizontal: 11, vertical: 16.0),
          isDense: true,
          fillColor: const Color(0xFF585859),
          labelStyle: const TextStyle(
            color: Color(
              0xFF585859,
            ),
          ),
          hintStyle: const TextStyle(
            color: Color(
              0xFFD2D0D0,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(
                0xFFBAB7B7,
              ),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(
              color: mainColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFFBAB7B7).withOpacity(0.4),
            ),
          ),
        ),
    dividerTheme: Theme.of(context).dividerTheme.copyWith(
          color: const Color(0xFFECEBF5),
          thickness: 1,
        ),
  );
}

ThemeData darkTheme(BuildContext context) {
  Color scaffoldColor = const Color(0xFF1F1F1F);
  Color mainColor = const Color(0xFF0A2472);
  Color cardColor = const Color(0xFF292929);

  return ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: scaffoldColor,
    primaryColorDark: scaffoldColor,
    dialogBackgroundColor: cardColor,
    appBarTheme: Theme.of(context).appBarTheme.copyWith(systemOverlayStyle: SystemUiOverlayStyle.light, backgroundColor: const Color(0xFFDEDEDE)),
    primarySwatch: Platform.isAndroid ? null : Colors.blue,
    primaryColor: Theme.of(context).scaffoldBackgroundColor,
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: const Color(0x00f8f8f8),
      errorColor: const Color(0xFFEB5757),
    ),
    iconTheme: const IconThemeData(color: Color(0xFFF6F6F8)),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        elevation: 1,
        textStyle: const TextStyle(color: Colors.white),
        enableFeedback: false,
      ),
    ),
    buttonTheme: ButtonThemeData(buttonColor: scaffoldColor, colorScheme: ColorScheme.fromSwatch(backgroundColor: scaffoldColor)),
    focusColor: const Color(0xFF42434F),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    cardColor: cardColor,
    tabBarTheme: const TabBarTheme(
      labelColor: Color(0xFFF6F6F8),
      indicatorColor: Color(0xFF478EFF),
    ),
    listTileTheme: Theme.of(context).listTileTheme.copyWith(
          iconColor: const Color(0xFFF6F6F8),
          textColor: const Color(0xFFF6F6F8),
          selectedTileColor: const Color(0xFF434360),
          tileColor: scaffoldColor,
        ),
    splashColor: const Color(0xFFD9EBFA),
    badgeTheme: const BadgeThemeData(textColor: Color(0xFFFEC89A)),
    disabledColor: const Color(0xFFC6C3C3),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xFF84E3C8),
    ),
    canvasColor: const Color(0xFF434360),
    dropdownMenuTheme: DropdownMenuThemeData(
        menuStyle: MenuStyle(
      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF434360)),
    )),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: scaffoldColor),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(letterSpacing: 2, fontSize: 25, fontWeight: FontWeight.w600, color: Color(0xFFF6F6F8)),
      bodyMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Color(0xFFF6F6F8)),
      titleSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFFF6F6F8)),
      titleMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(0xFFF6F6F8)),
    ),
    inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
          contentPadding: const EdgeInsets.symmetric(horizontal: 11, vertical: 16.0),
          isDense: true,
          fillColor: const Color(0xFFF5F5F7),
          labelStyle: const TextStyle(color: Color(0xFFF6F6F8)),
          hintStyle: const TextStyle(color: Color(0xFFA6A5A5), fontSize: 14),
          border: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFBAB7B7))),
          focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(6)), borderSide: BorderSide(color: Color(0xFFB2B2B2))),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: const Color(0xFFBAB7B7).withOpacity(0.4))),
        ),
    dividerTheme: Theme.of(context).dividerTheme.copyWith(color: const Color(0xFFF6F6F8)),
  );
}
