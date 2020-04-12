import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:citizen_science/theme/blackberrywine_themecolor.dart';

class CSTextStyle {
  static TextStyle hugeTitleTextStyle = TextStyle(
//      color: Colors.black54,
    color: Colors.black87,
    fontFamily: "Quicksand",
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w500,
    fontSize: 35.0,
    letterSpacing: 1.2,
  );

  static TextStyle largeTitleTextStyle = TextStyle(
//      color: Colors.black54,
    color: Colors.black87,
    fontFamily: "Quicksand",
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w500,
    fontSize: 30.0,
    letterSpacing: 1.2,
  );

  static TextStyle titleTextStyle = TextStyle(
//      color: Colors.black54,
    color: Colors.black87,
    fontFamily: "Quicksand",
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w500,
    fontSize: 22.0,
  );

  static TextStyle normal = TextStyle(
    color: Colors.black87,
//    color: ThemeColorBlackberryWine.redWine[700],
    fontFamily: "Quicksand",
    fontWeight: FontWeight.w300,
    decoration: TextDecoration.none,
//    fontStyle: FontStyle.italic,
    fontSize: 13.0,
  );

  static TextStyle notificationTitle = TextStyle(
    color: Colors.grey,
//    color: ThemeColorBlackberryWine.redWine[700],
    fontFamily: "Quicksand",
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
//    fontStyle: FontStyle.italic,
    fontSize: 13.0,
  );

  static TextStyle subtitleTextStyle = TextStyle(
    color: Colors.black87,
//    color: ThemeColorBlackberryWine.redWine[700],
    fontFamily: "Quicksand",
    fontWeight: FontWeight.w300,
    decoration: TextDecoration.none,
//    fontStyle: FontStyle.italic,
    fontSize: 15.0,
  );

  static TextStyle titleWithShadow = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'ConcertOne-Regular',
    color: Colors.grey,
    shadows: [
      Shadow(color: Colors.black26, offset: Offset(2.0, 2.0), blurRadius: 2.0)
    ],
  );

  static TextStyle subtitleWithShadow = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'ConcertOne-Regular',
    color: Colors.grey,
    shadows: [
      Shadow(color: Colors.black26, offset: Offset(2.0, 2.0), blurRadius: 2.0)
    ],
  );

  static TextStyle midtitleTextStyle = TextStyle(
    color: Colors.black87,
//    color: ThemeColorBlackberryWine.redWine[700],
    fontFamily: "Quicksand",
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
//    fontStyle: FontStyle.italic,
    fontSize: 18.0,
  );

  static TextStyle button = TextStyle(
    color: Colors.white,
    fontFamily: "Quicksand",
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    wordSpacing: 1.2,
    letterSpacing: 1.2,
//    fontStyle: FontStyle.italic,
    fontSize: 13.0,
//    decoration: TextDecoration.underline,
  );

  static TextStyle settingEntry = TextStyle(
    color: Colors.black87,
    fontFamily: "Quicksand",
    fontWeight: FontWeight.w300,
    decoration: TextDecoration.none,
    wordSpacing: 1.2,
    letterSpacing: 1.2,
//    fontStyle: FontStyle.italic,
    fontSize: 16.0,
//    decoration: TextDecoration.underline,
  );
}
