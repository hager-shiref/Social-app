import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
    primarySwatch: defaultColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      titleSpacing: 20.0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0.0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        elevation: 20.0),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        subtitle1: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            height: 1.3)),
    fontFamily: "Archivo");
