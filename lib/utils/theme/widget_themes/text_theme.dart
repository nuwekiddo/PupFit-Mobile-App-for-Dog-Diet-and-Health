import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
      color: Colors.black87,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    headline2: GoogleFonts.montserrat(
        color: Colors.black87, fontSize: 24, fontWeight: FontWeight.w700),
    headline3: GoogleFonts.montserrat(
        color: Colors.black87, fontSize: 24, fontWeight: FontWeight.w700),
    headline4: GoogleFonts.montserrat(
        color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600),
    headline6: GoogleFonts.montserrat(
        color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w600),
    bodyText1: GoogleFonts.poppins(
        color: Colors.black54, fontSize: 14, fontWeight: FontWeight.normal),
    bodyText2: GoogleFonts.poppins(
        color: Colors.black54, fontSize: 14, fontWeight: FontWeight.normal),
  );

  static TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
      color: Colors.white70,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    headline2: GoogleFonts.montserrat(
        color: Colors.white70, fontSize: 24, fontWeight: FontWeight.w700),
    headline3: GoogleFonts.montserrat(
        color: Colors.white70, fontSize: 24, fontWeight: FontWeight.w700),
    headline4: GoogleFonts.montserrat(
        color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w600),
    headline6: GoogleFonts.montserrat(
        color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w600),
    bodyText1: GoogleFonts.poppins(
        color: Colors.white70, fontSize: 14, fontWeight: FontWeight.normal),
    bodyText2: GoogleFonts.poppins(
        color: Colors.white70, fontSize: 14, fontWeight: FontWeight.normal),
  );
}
