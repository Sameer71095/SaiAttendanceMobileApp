import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

final NeumorphicThemeData customNeumorphicTheme = NeumorphicThemeData(
  baseColor: Color(0xFFf0f0f0),
  accentColor: Color(0xFF5c9ced),
  variantColor: Colors.blueGrey,

  // Neumorphic theme properties
  depth: 10,
  intensity: 0.7,
  lightSource: LightSource.topLeft,
  shadowDarkColor: Colors.black,
  shadowLightColor: Colors.white,
  shadowDarkColorEmboss: Colors.black,
  shadowLightColorEmboss: Colors.white,

  // Typography
  textTheme: TextTheme(
    bodyText1: TextStyle(fontSize: 18.0, color: Colors.black, fontFamily: 'Roboto'),
    bodyText2: TextStyle(fontSize: 16.0, color: Colors.black, fontFamily: 'Roboto'),
    headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
    headline2: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
    headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
    headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
    headline5: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
    headline6: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
    subtitle1: TextStyle(fontSize: 16.0, color: Colors.grey[700], fontFamily: 'Roboto'),
    subtitle2: TextStyle(fontSize: 14.0, color: Colors.grey[700], fontFamily: 'Roboto'),
    button: TextStyle(fontSize: 16.0, color: Color(0xFF5c9ced), fontFamily: 'Roboto'),
    caption: TextStyle(fontSize: 12.0, color: Colors.grey[700], fontFamily: 'Roboto'),
    overline: TextStyle(fontSize: 10.0, color: Colors.grey[700], fontFamily: 'Roboto'),
  ),

  // AppBar properties
  appBarTheme: NeumorphicAppBarThemeData(
    textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
   
  ),


);
