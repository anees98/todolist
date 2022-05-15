import 'package:flutter/material.dart';

Map<int, Color> _orange300Map = {
  50: Color(0xFFFFBF00),//FFBF00
  100: Colors.orange[100]!,
  200: Colors.orange[200]!,
  300: Colors.orange[300]!,
  400: Colors.orange[400]!,
  500: Colors.orange[500]!,
  600: Colors.orange[600]!,
  700: Colors.orange[800]!,
  800: Colors.orange[900]!,
  900: Colors.orange[700]!,
};

Color colorWhite = Colors.white;
MaterialColor orange300Swatch = MaterialColor(Colors.orange[300]!.value, _orange300Map);

