import 'package:flutter/material.dart'
    show AppBarTheme, BorderRadius, BorderSide, ColorScheme, Colors, EdgeInsets, IconThemeData, InputDecorationTheme, OutlineInputBorder, TextStyle, TextTheme, ThemeData;
import 'package:flutter/services.dart';
import 'constants.dart';

  final baseTheme = ThemeData(
     colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    // primarySwatch: primarySwatchColor,
    primaryColor: primaryColor,
    fontFamily: "Lexend Deca",
    appBarTheme: AppBarTheme(
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.white,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: primaryColor, size: 20),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w900,
        color: primaryColor,
        decorationColor: primaryColor,
      ),
    ),
    textTheme: TextTheme(
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: blackColor,
        decorationColor: blackColor,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: blackColor,
        decorationColor: blackColor,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w900,
        color: blackColor,
        decorationColor: blackColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: blackColor,
        decorationColor: blackColor,
      ),
      titleLarge: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        decorationColor: Colors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
     filled: true,
            fillColor: Colors.grey.withOpacity(0.1),
            contentPadding: const EdgeInsets.all(3.0).copyWith(left:15),
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w400),
          // floatingLabelStyle: TextStyle(color: blackColor),
          // labelStyle: TextStyle(color: blackColor, fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ), 
        ),
        
  );
