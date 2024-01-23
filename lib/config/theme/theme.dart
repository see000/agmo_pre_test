
import 'package:agmo_pre_test/core/constants/enums.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.deepPurple,
    ),
    useMaterial3: true,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),

  );
}

AppBarTheme appBarTheme () {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  );
}


TextTheme textTheme() {
  return Typography.whiteCupertino;
}

Color eventTypeLabelColor(EventType eventType) {
  switch (eventType) {
    case EventType.inReachProgramme:
      return Colors.purple.shade300;
    default:
      return Colors.deepPurple;
  }
}
