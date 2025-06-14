import 'package:flutter/material.dart';

class AppColors {
  static const primaryBlue = Color(0xFF4392F9);
  static const lightGray = Color(0xFFF5F5F5);
  static const darkText = Color(0xFF1E1E1E);
  static const green = Color(0xFF4CAF50);
  static const red = Color(0xFFF44336);
  static const white = Color(0xFFFFFFFF);
  static const backgroundColor = Color(0xFFF8F8F8);
  static const textfieldicon = Color(0xFFBBBBBB);
  static const yellow = Color(0xFFEDB310);
  static const lightRed = Color(0xFFFE735C);
  static const black = Colors.black;
  static const pinkishRed = Color(0xFFF83758);
  static const lightPink = Color(0xFFFD6E87);
  static const coralPink = Color(0xFFFA7189);
  static const lightBlushPink = Color(0xFFFFCCD5);
  static const lightGrey = Color(0xFFD9D9D9);
  static const veryLightGray = Color(0xFFA8A8A9);
  static const darkLabel = Color(0xFF4C5059);
  static const mediumGray1 = Color(0xFFA7A7A7);
  static const darkGrey = Color(0xFF222222);

  static const lightGreyBorder = Color(0xFFC8C8C8);
  static const darkCharcoal = Color(0xFF232327);
  static const mediumGray = Color(0xFF828282);
  static const almostWhite = Color(0xFFFDFDFD);
  static const darkMaroon = Color(0xFF0E0808);
  static const crimsonRed = Color(0xFFEB3030);
  static const fireEngineRed = Color(0xFFEA1712);

  static const gradientStart = Color(0xFF3F92FF); // 0%
  static const gradientEnd = Color(0xFF0B3689); // 100%

  static const LinearGradient blueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [gradientStart, gradientEnd],
  );

  static const mintGreen = Color(0xFF71F9A9); // 0%
  static const mediumGreen = Color(0xFF31B769);

  static const LinearGradient greenGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [mintGreen, mediumGreen],
  );
}
