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
            fillColor: Colors.transparent,
            contentPadding: const EdgeInsets.all(8.0),
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w400,),
          floatingLabelStyle: TextStyle(color: greenColor, fontSize: 14),
          labelStyle: TextStyle(color: greenColor, fontSize: 14,fontWeight: FontWeight.w500,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black45,width: 1),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  const BorderSide(color: Colors.black45,width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  const BorderSide(color: Colors.black45,width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: greenColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  BorderSide(color: greenColor,width: 2),
          ), 
        ),
        
  );
