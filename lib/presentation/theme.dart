import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryColors {
  static final purple = Color(0xff5117AC);
  static final green = Color(0xff20D0C4);
  static final dark = Color(0xff03091E);
  static final grey = Color(0xff212738);
  static final lightGrey = Color(0xffBBBBBB);
  static final veryLightGrey = Color(0xffF3F3F3);
  static final white = Color(0xffffffff);
  static final pink = Color(0xfff5638B);
}

final deliveryGradients = [DeliveryColors.green, DeliveryColors.purple];
final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
        color: DeliveryColors.veryLightGrey,
        width: 2,
        style: BorderStyle.solid));
final lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
        color: DeliveryColors.white,
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
            headline6: TextStyle(
                fontSize: 20,
                color: DeliveryColors.purple,
                fontWeight: FontWeight.bold))),
    canvasColor: DeliveryColors.white,
    accentColor: DeliveryColors.purple,
    bottomAppBarColor: DeliveryColors.veryLightGrey,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: DeliveryColors.purple, displayColor: DeliveryColors.purple),
    inputDecorationTheme: InputDecorationTheme(
        border: _border,
        focusedBorder: _border,
        contentPadding: EdgeInsets.zero,
        labelStyle: TextStyle(color: DeliveryColors.purple),
        hintStyle:
            GoogleFonts.poppins(color: DeliveryColors.lightGrey, fontSize: 10)),
    iconTheme: IconThemeData(color: DeliveryColors.purple));

final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
        color: DeliveryColors.purple,
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
            headline6: TextStyle(
                fontSize: 20,
                color: DeliveryColors.white,
                fontWeight: FontWeight.bold))),
    canvasColor: DeliveryColors.grey,
    accentColor: DeliveryColors.white,
    bottomAppBarColor: Colors.transparent,
    scaffoldBackgroundColor: DeliveryColors.dark,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: DeliveryColors.green, displayColor: DeliveryColors.green),
    inputDecorationTheme: InputDecorationTheme(
        border: _border,
        focusedBorder: _border,
        contentPadding: EdgeInsets.zero,
        labelStyle: TextStyle(color: DeliveryColors.white),
        fillColor: DeliveryColors.grey,
        filled: true,
        hintStyle:
            GoogleFonts.poppins(color: DeliveryColors.white, fontSize: 10)),
    iconTheme: IconThemeData(color: DeliveryColors.white));
